--- Query: Create a stored procedure named ComputeAverageScoreForUser that receives a user_id as a parameter and calculates the average score for that user. The result should be stored in the average_scores table. The average score should be stored with two decimal places.
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    SELECT AVG(score) INTO avg_score
    FROM scores
    WHERE user_id = user_id;

    INSERT INTO average_scores (user_id, average_score)
    VALUES (user_id, avg_score);
END //

DELIMITER ;