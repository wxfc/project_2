def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'ratethatagent'})
    results = db.exec(sql)
    db.close
    return results
 end

def find_all_houses
    run_sql('SELECT * FROM houses;')
end

def find_one_house_by_id(id)
    house = run_sql("SELECT * FROM houses WHERE id = #{id};")
    return house.first
end

def create_review(number_street, suburb, postcode, image_url, agent, review, user_id)
    sql = "INSERT INTO houses (number_street, suburb, postcode, image_url, agent, review, user_id) VALUES ('#{number_street}', '#{suburb}', #{postcode}, '#{image_url}', '#{agent}', '#{review}', #{user_id});"
    run_sql(sql)
end

def update_review(id, number_street, suburb, postcode, image_url, agent, review)
    sql = "UPDATE houses SET number_street = '#{number_street}', suburb = '#{suburb}', postcode = #{postcode}, image_url = '#{image_url}', agent =  '#{agent}', review = '#{review}' WHERE id = #{id};"
    run_sql(sql)
end

def destroy_review(id)
    sql = "DELETE FROM houses WHERE id = #{id}"
    run_sql(sql)
end

def find_one_house_by_user_id(user_id)
    house = run_sql("SELECT * FROM houses WHERE user_id = #{user_id};")
    return house.first
end

def find_houses_by_south_yarra(suburb)
    houses = run_sql("SELECT * FROM houses WHERE suburb = ''South Yarra'';")
    return houses
end