class User < ActiveRecord::Base

	# Deixando maíusculo/mínusculo alguns valores do registro
  	before_save {
  		|user| user.name = user.name.upcase
  	}

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	# devise:database_authenticatable, :recoverable, :rememberable,
	#		:trackable, :confirmable, :lockable, :registerable, :validatable

	devise 	:database_authenticatable, :registerable,
	        :recoverable, :rememberable, :trackable, :validatable, 
	        :confirmable, :lockable, :timeoutable

	# paperclip, photo user management
	# attr_accessible :avatar
	has_attached_file 	:avatar, styles: { :medium => '300x300>', :thumb => '100x100>' }, 
						default_url: 'devise_default_avatar.png'
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	# verificar se existe um registro com um determinado
	# token. contexto representa qual ação o usuário está
	# tomando, como :reset_password_token, :confirmation_token
	def self.valid_token token, context
	  	return User.exists?(:"#{context}"=> Devise.token_generator.digest(User, context, token))
	end
end
