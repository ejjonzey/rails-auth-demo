class Ability
    include CanCan::Ability
   
    def initialize(user)
      user ||= User.new # guest user (not logged in)
      can :read, Post
      
      can [:create, :update, :destroy], Post do |post|
        post.user == user
      end
    end
   end