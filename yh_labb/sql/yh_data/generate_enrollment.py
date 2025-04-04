import csv
import random

def generate_enrollment_csv(filename="enrollment.csv"):
    """Generates enrollment data and saves it to a CSV file."""

    enrollments = []

    # DE23 (class_id = 1)
    DE23 = [1, 2, 3, 4, 5, 26, 31, 36, 41, 46]
    for student_id in DE23:
        for offering_id in range(1, 13):
            grade_id = random.choice([1, 2, 3])
            enrollments.append([student_id, offering_id, grade_id])

    # BIM23 (class_id = 2)
    BIM23 = [6, 7, 8, 9, 10, 27, 32, 37, 42, 47]
    for student_id in BIM23:
        for offering_id in range(13, 26):
            grade_id = random.choice([1, 2, 3])
            enrollments.append([student_id, offering_id, grade_id])

    # DE24 (class_id = 3)
    DE24 = [11, 12, 13, 14, 15, 28, 33, 38, 43, 48]
    for student_id in DE24:
        for offering_id in range(26, 32):
            grade_id = random.choice([1, 2, 3])
            enrollments.append([student_id, offering_id, grade_id])

    # BIM24 (class_id = 4)
    BIM24 = [16, 17, 18, 19, 20, 29, 34, 39, 44, 49]
    for student_id in BIM24: # corrected range
        for offering_id in range(32, 41):
            grade_id = random.choice([1, 2, 3])
            enrollments.append([student_id, offering_id, grade_id])

    # UX24 (class_id = 5)
    UX24 = [21, 22, 23, 24, 25, 30, 35, 40, 45, 50]
    for student_id in UX24: # corrected range
        for offering_id in range(41, 47):
            grade_id = random.choice([1, 2, 3])
            enrollments.append([student_id, offering_id, grade_id])

    # stand alone course 38, location will be: online
    for student_id in range(26,31):
        enrollments.append([student_id, 47, random.choice([1,2,3])])
    for student_id in range(46,51):
        enrollments.append([student_id,47, random.choice([1,2,3])])
    for student_id in range (36,46):
        enrollments.append([student_id,48, random.choice([1,2,3])])

    with open(filename, "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(["student_id", "offering_id", "grade_id"])  # Header
        writer.writerows(enrollments)

generate_enrollment_csv()
print(f"enrollment.csv generated successfully.")