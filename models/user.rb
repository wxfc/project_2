require "bcrypt"

def run_user_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'ratethatagent'})
    results = db.exec(sql)
    db.close
    return results
 end

def find_all_users
    run_user_sql("SELECT * FROM users")
end

def find_one_user_by_id(id)
    user = run_user_sql("SELECT * FROM users WHERE id = #{id};")
    return user.first
end

def find_one_user_by_email(email)
    users = run_user_sql("SELECT * FROM users WHERE email = '#{email}';")
    return users.first
end

def create_user(name, email, password)
    password_digest = BCrypt::Password.create(password)

    sql = "INSERT INTO users (name, email, password_digest) VALUES ('#{name}', '#{email}', '#{password_digest}')"
    run_user_sql(sql)
end