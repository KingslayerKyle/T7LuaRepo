CoD.Social_PartyMemberIconLarge = InheritFrom( LUI.UIElement )
CoD.Social_PartyMemberIconLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyMemberIconLarge )
	self.id = "Social_PartyMemberIconLarge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 60 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, true, -2, 2 )
	Icon:setTopBottom( true, true, -2, 2 )
	Icon:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymemberlarge" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, true, -2, 2 )
				self.Icon:setTopBottom( true, true, -3, 7 )
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		PartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.29, 0.38, 0.68 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMemberTopOrMiddle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( true, true, -2, 2 )
				self.Icon:setTopBottom( true, true, -3, 8 )
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		OtherPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.65, 0.65, 0.65 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return ParentPropertyIsTrue( self, "isPartyMemberTopOrMiddle" )
			end
		},
		{
			stateName = "PartyMember",
			condition = function ( menu, element, event )
				return ParentPropertyIsTrue( self, "isPartyMember" )
			end
		},
		{
			stateName = "OtherPartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return ParentPropertyIsTrue( self, "isOtherMemberTopOrMiddle" )
			end
		},
		{
			stateName = "OtherPartyMember",
			condition = function ( menu, element, event )
				return ParentPropertyIsTrue( self, "isOtherMember" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

