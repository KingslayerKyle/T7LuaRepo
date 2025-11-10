CoD.MedalXpWidget = InheritFrom( LUI.UIElement )
CoD.MedalXpWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalXpWidget )
	self.id = "MedalXpWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 145 )
	self:setTopBottom( true, false, 0, 46 )
	
	local XpIcon = LUI.UIImage.new()
	XpIcon:setLeftRight( true, false, 0, 46.29 )
	XpIcon:setTopBottom( true, false, 0, 46.29 )
	XpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpIcon )
	self.XpIcon = XpIcon
	
	local XpValue = LUI.UITightText.new()
	XpValue:setLeftRight( true, false, 57.43, 145.44 )
	XpValue:setTopBottom( true, false, 10.65, 35.65 )
	XpValue:setText( Engine.Localize( "+1000 XP" ) )
	XpValue:setTTF( "fonts/default.ttf" )
	self:addElement( XpValue )
	self.XpValue = XpValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XpIcon:completeAnimation()
				self.XpIcon:setAlpha( 0 )
				self.clipFinished( XpIcon, {} )
				XpValue:completeAnimation()
				self.XpValue:setAlpha( 0 )
				self.clipFinished( XpValue, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XpIcon:completeAnimation()
				self.XpIcon:setAlpha( 1 )
				self.clipFinished( XpIcon, {} )
				XpValue:completeAnimation()
				self.XpValue:setAlpha( 1 )
				self.clipFinished( XpValue, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "aarType", "public" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

