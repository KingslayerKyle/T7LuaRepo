CoD.Social_InfoPane_Friendship = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Friendship.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Friendship )
	self.id = "Social_InfoPane_Friendship"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 133 )
	self:setTopBottom( 0, 0, 0, 34 )
	
	local yourFriend = LUI.UIText.new()
	yourFriend:setLeftRight( 0, 0, 5, 119 )
	yourFriend:setTopBottom( 0, 0, 4.5, 29.5 )
	yourFriend:setText( Engine.Localize( "MENU_YOUR_FRIEND" ) )
	yourFriend:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	yourFriend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	yourFriend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( yourFriend )
	self.yourFriend = yourFriend
	
	self.resetProperties = function ()
		yourFriend:completeAnimation()
		yourFriend:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				yourFriend:completeAnimation()
				self.yourFriend:setAlpha( 0 )
				self.clipFinished( yourFriend, {} )
			end
		},
		YourFriend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "YourFriend",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "showyourfriend" )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

