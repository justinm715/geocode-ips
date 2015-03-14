require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../config/config.rb')

output_path = File.join(DUMPS_PATH, 'located_users_output.csv')

DB.exec """
  COPY (
    SELECT
      user_id,
      username,
      latitude,
      longitude
    FROM users
    WHERE latitude IS NOT NULL
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""

output_path = File.join(DUMPS_PATH, 'located_active_project_customers_output.csv')

DB.exec """
  COPY (
    SELECT
      users.user_id,
      username,
      latitude,
      longitude
    FROM users
    LEFT JOIN project_members ON project_members.user_id = users.user_id
    WHERE project_members.project_id IN (
      1557, 1546, 1280, 217, 1513, 938, 1135, 1084, 1139, 920, 1138, 1494, 1506, 1556, 1175, 1608, 1531, 1578, 1576, 1719, 1880, 1905, 1935, 1952, 1478, 790, 2303, 2267, 2011, 2372, 2426, 2261, 2725, 2730, 2364, 2700, 1413, 1992, 2822, 2920, 2865, 2249, 2748, 3013, 3024, 2395, 3603
    )
    AND role = 'customer'
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""


output_path = File.join(DUMPS_PATH, 'located_active_project_architects_output.csv')

DB.exec """
  COPY (
    SELECT
      users.user_id,
      username,
      latitude,
      longitude
    FROM users
    LEFT JOIN project_members ON project_members.user_id = users.user_id
    WHERE project_members.project_id IN (
      1557, 1546, 1280, 217, 1513, 938, 1135, 1084, 1139, 920, 1138, 1494, 1506, 1556, 1175, 1608, 1531, 1578, 1576, 1719, 1880, 1905, 1935, 1952, 1478, 790, 2303, 2267, 2011, 2372, 2426, 2261, 2725, 2730, 2364, 2700, 1413, 1992, 2822, 2920, 2865, 2249, 2748, 3013, 3024, 2395, 3603
    )
    AND role = 'architect'
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""


output_path = File.join(DUMPS_PATH, 'located_active_project_gcs_output.csv')

DB.exec """
  COPY (
    SELECT
      users.user_id,
      username,
      latitude,
      longitude
    FROM users
    LEFT JOIN project_members ON project_members.user_id = users.user_id
    WHERE project_members.project_id IN (
      1557, 1546, 1280, 217, 1513, 938, 1135, 1084, 1139, 920, 1138, 1494, 1506, 1556, 1175, 1608, 1531, 1578, 1576, 1719, 1880, 1905, 1935, 1952, 1478, 790, 2303, 2267, 2011, 2372, 2426, 2261, 2725, 2730, 2364, 2700, 1413, 1992, 2822, 2920, 2865, 2249, 2748, 3013, 3024, 2395, 3603
    )
    AND role = 'general_contractor'
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""

output_path = File.join(DUMPS_PATH, 'located_active_project_users_output.csv')

DB.exec """
  COPY (
    SELECT
      users.user_id,
      username,
      latitude,
      longitude
    FROM users
    LEFT JOIN project_members ON project_members.user_id = users.user_id
    WHERE project_members.project_id IN (
      1557, 1546, 1280, 217, 1513, 938, 1135, 1084, 1139, 920, 1138, 1494, 1506, 1556, 1175, 1608, 1531, 1578, 1576, 1719, 1880, 1905, 1935, 1952, 1478, 790, 2303, 2267, 2011, 2372, 2426, 2261, 2725, 2730, 2364, 2700, 1413, 1992, 2822, 2920, 2865, 2249, 2748, 3013, 3024, 2395, 3603
    )
    AND role IN ('general_contractor', 'architect', 'customer')
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""


