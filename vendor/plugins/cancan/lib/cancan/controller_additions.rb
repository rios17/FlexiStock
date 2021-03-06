module CanCan

  # This module is automatically included into all controllers.
  # It also makes the "can?" and "cannot?" methods available to all views.
  module ControllerAdditions
    module ClassMethods
      # Sets up a before filter which loads and authorizes the current resource. This performs both
      # load_resource and authorize_resource and accepts the same arguments. See those methods for details.
      #
      #   class BooksController < ApplicationController
      #     load_and_authorize_resource
      #   end
      #
      def load_and_authorize_resource(*args)
        cancan_resource_class.add_before_filter(self, :load_and_authorize_resource, *args)
      end

      # Sets up a before filter which loads the model resource into an instance variable.
      # For example, given an ArticlesController it will load the current article into the @article
      # instance variable. It does this by either calling Article.find(params[:id]) or
      # Article.new(params[:article]) depending upon the action. It does nothing for the "index"
      # action.
      #
      # If a conditions hash is used in the Ability, the +new+ and +create+ actions will set
      # the initial attributes based on these conditions. This way these actions will satisfy
      # the ability restrictions.
      #
      # Call this method directly on the controller class.
      #
      #   class BooksController < ApplicationController
      #     load_resource
      #   end
      #
      # A resource is not loaded if the instance variable is already set. This makes it easy to override
      # the behavior through a before_filter on certain actions.
      #
      #   class BooksController < ApplicationController
      #     before_filter :find_book_by_permalink, :only => :show
      #     load_resource
      #
      #     private
      #
      #     def find_book_by_permalink
      #       @book = Book.find_by_permalink!(params[:id)
      #     end
      #   end
      #
      # If a name is provided which does not match the controller it assumes it is a parent resource. Child
      # resources can then be loaded through it.
      #
      #   class BooksController < ApplicationController
      #     load_resource :author
      #     load_resource :book, :through => :author
      #   end
      #
      # Here the author resource will be loaded before each action using params[:author_id]. The book resource
      # will then be loaded through the @author instance variable.
      #
      # That first argument is optional and will default to the singular name of the controller.
      # A hash of options (see below) can also be passed to this method to further customize it.
      #
      # See load_and_authorize_resource to automatically authorize the resource too.
      #
      # Options:
      # [:+only+]
      #   Only applies before filter to given actions.
      #
      # [:+except+]
      #   Does not apply before filter to given actions.
      #
      # [:+through+]
      #   Load this resource through another one. This should match the name of the parent instance variable or method.
      #
      # [:+shallow+]
      #   Pass +true+ to allow this resource to be loaded directly when parent is +nil+. Defaults to +false+.
      #
      # [:+singleton+]
      #   Pass +true+ if this is a singleton resource through a +has_one+ association.
      #
      # [:+parent+]
      #   True or false depending on if the resource is considered a parent resource. This defaults to +true+ if a resource
      #   name is given which does not match the controller.
      #
      # [:+class+]
      #   The class to use for the model (string or constant).
      #
      # [:+instance_name+]
      #   The name of the instance variable to load the resource into.
      #
      # [:+find_by+]
      #   Find using a different attribute other than id. For example.
      #
      #     load_resource :find_by => :permalink # will use find_by_permlink!(params[:id])
      #
      # [:+collection+]
      #   Specify which actions are resource collection actions in addition to :+index+. This
      #   is usually not necessary because it will try to guess depending on if the id param is present.
      #
      #     load_resource :collection => [:sort, :list]
      #
      # [:+new+]
      #   Specify which actions are new resource actions in addition to :+new+ and :+create+.
      #   Pass an action name into here if you would like to build a new resource instead of
      #   fetch one.
      #
      #     load_resource :new => :build
      #
      def load_resource(*args)
        cancan_resource_class.add_before_filter(self, :load_resource, *args)
      end

      # Sets up a before filter which authorizes the resource using the instance variable.
      # For example, if you have an ArticlesController it will check the @article instance variable
      # and ensure the user can perform the current action on it. Under the hood it is doing
      # something like the following.
      #
      #   authorize!(params[:action].to_sym, @article || Article)
      #
      # Call this method directly on the controller class.
      #
      #   class BooksController < ApplicationController
      #     authorize_resource
      #   end
      #
      # If you pass in the name of a resource which does not match the controller it will assume
      # it is a parent resource.
      #
      #   class BooksController < ApplicationController
      #     authorize_resource :author
      #     authorize_resource :book
      #   end
      #
      # Here it will authorize :+show+, @+author+ on every action before authorizing the book.
      #
      # That first argument is optional and will default to the singular name of the controller.
      # A hash of options (see below) can also be passed to this method to further customize it.
      #
      # See load_and_authorize_resource to automatically load the resource too.
      #
      # Options:
      # [:+only+]
      #   Only applies before filter to given actions.
      #
      # [:+except+]
      #   Does not apply before filter to given actions.
      #
      # [:+parent+]
      #   True or false depending on if the resource is considered a parent resource. This defaults to +true+ if a resource
      #   name is given which does not match the controller.
      #
      # [:+class+]
      #   The class to use for the model (string or constant). This passed in when the instance variable is not set.
      #   Pass +false+ if there is no associated class for this resource and it will use a symbol of the resource name.
      #
      # [:+instance_name+]
      #   The name of the instance variable for this resource.
      #
      # [:+through+]
      #   Authorize conditions on this parent resource when instance isn't available.
      #
      def authorize_resource(*args)
        cancan_resource_class.add_before_filter(self, :authorize_resource, *args)
      end

      # Add this to a controller to ensure it performs authorization through +authorized+! or +authorize_resource+ call.
      # If neither of these authorization methods are called, a CanCan::AuthorizationNotPerformed exception will be raised.
      # This is normally added to the ApplicationController to ensure all controller actions do authorization.
      #
      #   class ApplicationController < ActionController::Base
      #     check_authorization
      #   end
      #
      # Any arguments are passed to the +after_filter+ it triggers.
      #
      # See skip_authorization to bypass this check on specific controller actions.
      def check_authorization(*args)
        self.after_filter(*args) do |controller|
          unless controller.instance_variable_defined?(:@_authorized)
            raise AuthorizationNotPerformed, "This action failed the check_authorization because it does not authorize_resource. Add skip_authorization to bypass this check."
          end
        end
      end

      # Call this in the class of a controller to skip the check_authorization behavior on the actions.
      #
      #   class HomeController < ApplicationController
      #     skip_authorization :only => :index
      #   end
      #
      # Any arguments are passed to the +before_filter+ it triggers.
      def skip_authorization(*args)
        self.before_filter(*args) do |controller|
          controller.instance_variable_set(:@_authorized, true)
        end
      end

      def cancan_resource_class
        if ancestors.map(&:to_s).include? "InheritedResources::Actions"
          InheritedResource
        else
          ControllerResource
        end
      end
    end

    def self.included(base)
      base.extend ClassMethods
      base.helper_method :can?, :cannot?
    end

    # Raises a CanCan::AccessDenied exception if the current_ability cannot
    # perform the given action. This is usually called in a controller action or
    # before filter to perform the authorization.
    #
    #   def show
    #     @article = Article.find(params[:id])
    #     authorize! :read, @article
    #   end
    #
    # A :message option can be passed to specify a different message.
    #
    #   authorize! :read, @article, :message => "Not authorized to read #{@article.name}"
    #
    # You can also use I18n to customize the message. Action aliases defined in Ability work here.
    #
    #   en:
    #     unauthorized:
    #       manage:
    #         all: "Not authorized to perform that action."
    #         user: "Not allowed to manage other user accounts."
    #       update:
    #         project: "Not allowed to update this project."
    #
    # You can rescue from the exception in the controller to customize how unauthorized
    # access is displayed to the user.
    #
    #   class ApplicationController < ActionController::Base
    #     rescue_from CanCan::AccessDenied do |exception|
    #       flash[:error] = exception.message
    #       redirect_to root_url
    #     end
    #   end
    #
    # See the CanCan::AccessDenied exception for more details on working with the exception.
    #
    # See the load_and_authorize_resource method to automatically add the authorize! behavior
    # to the default RESTful actions.
    def authorize!(*args)
      @_authorized = true
      current_ability.authorize!(*args)
    end

    def unauthorized!(message = nil)
      raise ImplementationRemoved, "The unauthorized! method has been removed from CanCan, use authorize! instead."
    end

    # Creates and returns the current user's ability and caches it. If you
    # want to override how the Ability is defined then this is the place.
    # Just define the method in the controller to change behavior.
    #
    #   def current_ability
    #     # instead of Ability.new(current_user)
    #     @current_ability ||= UserAbility.new(current_account)
    #   end
    #
    # Notice it is important to cache the ability object so it is not
    # recreated every time.
    def current_ability
      @current_ability ||= ::Ability.new(current_user)
    end

    # Use in the controller or view to check the user's permission for a given action
    # and object.
    #
    #   can? :destroy, @project
    #
    # You can also pass the class instead of an instance (if you don't have one handy).
    #
    #   <% if can? :create, Project %>
    #     <%= link_to "New Project", new_project_path %>
    #   <% end %>
    #
    # If it's a nested resource, you can pass the parent instance in a hash. This way it will
    # check conditions which reach through that association.
    #
    #   <% if can? :create, @category => Project %>
    #     <%= link_to "New Project", new_project_path %>
    #   <% end %>
    #
    # This simply calls "can?" on the current_ability. See Ability#can?.
    def can?(*args)
      current_ability.can?(*args)
    end

    # Convenience method which works the same as "can?" but returns the opposite value.
    #
    #   cannot? :destroy, @project
    #
    def cannot?(*args)
      current_ability.cannot?(*args)
    end
  end
end

if defined? ActionController
  ActionController::Base.class_eval do
    include CanCan::ControllerAdditions
  end
end
