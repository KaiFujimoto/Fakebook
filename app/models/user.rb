class User < ApplicationRecord

  has_attached_file :avatar, default_url: "FBdefault.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :cover_photo, default_url: "default.jpg"
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
  validates :first_name, :last_name, :email, :password_digest, :session_token, :gender, :birth_date, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, email: true
  after_initialize :ensure_session_token
  attr_reader :password

  has_many :authored_posts,
    class_name: :Post,
    foreign_key: :author_id

  has_many :wall_posts,
    class_name: :Post,
    foreign_key: :receiver_id

  has_many :sent_requests,
    class_name: :Friendship,
    foreign_key: :user_id

  has_many :received_requests,
    class_name: :Friendship,
    foreign_key: :friend_id

  has_many :comments,
    class_name: :Comment,
    foreign_key: :author_id

  def current_friends
    self.sent_requests.where("status = 'APPROVED'") + self.received_requests.where("status = 'APPROVED'")
  end

  def pending_friendships
    self.pending_friendships.where("status = 'pending'")
  end

  def pending_requests
     self.friend_requests.where("status='pending'")
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.is_password?(password) ? user : nil
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end


  # def asdf(id)
  #   Friendship.find_by(user_id: id).where(status: 1)
  #   Friendship.find_by(:friend_id: id).where(status: 1)
  # end

end
