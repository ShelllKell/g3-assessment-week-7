class UsersTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def create(name, message)
    insert_user_sql = <<-SQL
      INSERT INTO users (name, message)
      VALUES ('#{name.downcase}', '#{message.downcase}')
      RETURNING id
    SQL

    @database_connection.sql(insert_user_sql).first["id"]
  end


def user_setter
  user_setter = <<-SQL
    SELECT name
    FROM users
  SQL
  @database_connection.sql(user_setter).collect { |hash| hash["name"] }
end

end