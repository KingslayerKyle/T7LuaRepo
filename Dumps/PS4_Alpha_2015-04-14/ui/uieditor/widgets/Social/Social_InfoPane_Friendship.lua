require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 23 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 1, 0 )
	cacItemTitleGlow0:setTopBottom( true, true, -1, 0 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local yourFriend = LUI.UIText.new()
	yourFriend:setLeftRight( true, true, 8, -5 )
	yourFriend:setTopBottom( true, true, 3, -3 )
	yourFriend:setRGB( 0, 0, 0 )
	yourFriend:setText( Engine.Localize( "MENU_YOUR_FRIEND" ) )
	yourFriend:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	yourFriend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	yourFriend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( yourFriend )
	self.yourFriend = yourFriend
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 0 )
				self.clipFinished( cacItemTitleGlow0, {} )
				yourFriend:completeAnimation()
				self.yourFriend:setAlpha( 0 )
				self.clipFinished( yourFriend, {} )
			end
		},
		YourFriend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )
				yourFriend:completeAnimation()
				self.yourFriend:setAlpha( 1 )
				self.clipFinished( yourFriend, {} )
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
	self.close = function ( self )
		self.cacItemTitleGlow0:close()
		CoD.Social_InfoPane_Friendship.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

