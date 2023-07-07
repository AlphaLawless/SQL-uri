-- Cearense Championship

-- The Soccer Cearense Championship attracts thousands of fans every year and 
-- you work for a newspaper and are in charge to calculate the score table. 
-- Show a table with the following rows: the team name, number of matches, 
-- victories, defeats, draws, and scores. Knowing that the score is calculated 
-- with each victory valuing 3 points, draw valuing 1 and defeat valuing 0. 
-- In the end, show your table with the score from the highest to the lowest.


-- Schema

-- teams 
-- Column 	Type
-- id (PK) 	integer
-- name 	varchar (50)
-- matches Column 	Type
-- id (PK) 	integer
-- team_1 (FK) 	integer
-- team_2 (FK) 	integer
-- team_1_goals 	integer
-- team_2_goals 	integer

-- Tables
-- teams 
-- id 	name
-- 1 	CEARA
-- 2 	FORTALEZA
-- 3 	GUARANY DE SOBRAL
-- 4 	FLORESTA

-- matches id 	
-- team_1 	team_2 	team_1_goals 	team_2_goals
-- 1 	4 	1 	0 	4
-- 2 	3 	2 	0 	1
-- 3 	1 	3 	3 	0
-- 4 	3 	4 	0 	1
-- 5 	1 	2 	0 	0
-- 6 	2 	4 	2 	1

-- Output Sample
-- name 	            matches 	victories 	defeats 	draws 	score
-- CEARA 	            3 	      2 	        0 	      1     	7
-- FORTALEZA 	        3 	      2 	        0 	      1 	    7
-- FLORESTA 	        3 	      1 	        2 	      0 	    3
-- GUARANY DE SOBRAL 	3 	      0 	        3 	      0 	    0

SELECT t.name, COUNT(m.team_1 + m.team_2) AS matches,
	SUM(CASE
    WHEN (m.team_1_goals > m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_2_goals > m.team_1_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) AS victories,
	SUM(CASE
    WHEN (m.team_1_goals < m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals > m.team_2_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) AS defeats,
	SUM(case
		when (m.team_1_goals = m.team_2_goals
			and t.id = m.team_1)
			or (m.team_1_goals = m.team_2_goals
        and t.id = m.team_2) then 1 else 0 END) AS draws,
	SUM(CASE
    WHEN (m.team_1_goals = m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals = m.team_2_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) +
	SUM(CASE
    WHEN (m.team_1_goals > m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals < m.team_2_goals
      AND t.id = m.team_2) THEN 3 ELSE 0 END) AS score
FROM teams AS t, matches AS m
WHERE t.id = m.team_1 OR t.id = m.team_2
GROUP BY t.name ORDER BY score DESC;
