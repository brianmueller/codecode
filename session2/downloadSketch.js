// npm install puppeteer node-fetch fs path
// node downloadSketch.js

const puppeteer = require("puppeteer");
const fs = require("fs");
const path = require("path");
const fetch = require("node-fetch"); // ← correctly import fetch

(async () => {
    const username = "username1";
    const projectName = "projectid1";
    const url = `https://editor.p5js.org/${username}/sketches/${projectName}`;

    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();

    let projectJson = null;

    page.on("response", async (response) => {
        try {
            const reqUrl = response.url();
            if (reqUrl.includes(`/editor/${username}/projects/${projectName}`)) {
                const json = await response.json();
                if (json.project && json.project.files) {
                    projectJson = json.project;
                } else if (json.files) {
                    projectJson = json;
                }
            }
        } catch (e) { }
    });

    await page.goto(url, { waitUntil: "networkidle0" });
    await new Promise(resolve => setTimeout(resolve, 5000));

    if (!projectJson) {
        console.error("❌ Error: Project JSON not found in network responses.");
        await browser.close();
        process.exit(1);
    }

    const folderName = `downloads/${username}_${projectName}`;
    fs.mkdirSync(folderName, { recursive: true });

    const textFileTypes = new Set(["javascript", "html", "css"]);

    for (const file of projectJson.files || projectJson.project.files || []) {
        const filePath = path.join(folderName, file.name);


        if (file.content) {
            // 📝 Save text-based files
            fs.writeFileSync(filePath, file.content, "utf-8");
            console.log(`✅ Saved text file: ${file.name}`);
        } else if (file.url) {
            // 💾 Download binary files
            const res = await fetch(file.url);
            const buffer = await res.buffer();
            fs.writeFileSync(filePath, buffer);
            console.log(`✅ Downloaded binary file: ${file.name}`);
        } else {
            console.warn(`⚠️ Skipping file "${file.name}" (no content or URL).`);
        }
    }

    await browser.close();
})();

