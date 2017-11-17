# PROBLEM: I have a table (users) with two fields: id and name. 
# Write a SQL query (not Ruby code) that returns the first 5 names that contain 'r'. 
# The order should be:
#   First, words that start with 'r' in alphabetical order.
#   Second, words that contain 'r' in alphabetical order.
#   So - if my list of names is: Alex, Arik, Rebecca, Rose, Brad, Viki, Norman, Drake, Carrie, Taylor, Frank, Robert, Spencer, Chris.
# The order of the results should be: Rebecca, Robert, Rose, Arik, Brad.


SELECT
  name
FROM
  users
WHERE
  LOWER(name) LIKE '%r%'
ORDER BY
  case when LOWER(name) like 'r%' then 0 else 1 end,
  SUBSTRING(LOWER(name), 1, LOCATE('r', LOWER(name)) - 1)
LIMIT 5;
