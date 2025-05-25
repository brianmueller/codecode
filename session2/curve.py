from fractions import Fraction


def calculate_curve():
    # Define the raw scores and curved scores
    print("Provide two raw scores and their corresponding curved scores.")
    
    raw_min = float(input("Enter the first raw score: "))
    curved_min = float(input("Enter the first corresponding curved score: "))

    raw_max = float(input("Enter the second raw score: "))
    curved_max = float(input("Enter the second corresponding curved score: "))
    
    # Calculate the slope and intercept for the linear transformation
    slope = (curved_max - curved_min) / (raw_max - raw_min)
    intercept = curved_min - slope * raw_min
    return slope, intercept


def calculate_curved_score(slope, intercept, raw_score):
    # Apply the linear transformation to curve the score
    curved_score = slope * raw_score + intercept
    return curved_score


def main():
    # Calculate individual scores
    slope, intercept = calculate_curve()
    while True:
        raw_score_input = input("Enter the raw score to be curved: ")
        if not raw_score_input:
            exit(0)
        try:
            raw_score = float(Fraction(raw_score_input)) * 100
        except ValueError:
            print("Invalid input. Please enter a number or a fraction like 9/16.")
            exit(1)

        curved_score = calculate_curved_score(slope, intercept, raw_score)
        print(f"The curved score for a raw score of {raw_score} is: {curved_score:.1f}")


if __name__ == "__main__":
    main()