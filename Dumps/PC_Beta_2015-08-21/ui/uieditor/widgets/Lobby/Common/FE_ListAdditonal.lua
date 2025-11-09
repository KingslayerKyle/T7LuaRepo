CoD.FE_ListAdditonal = InheritFrom( LUI.UIElement )
CoD.FE_ListAdditonal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListAdditonal )
	self.id = "FE_ListAdditonal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	
	local StringA = LUI.UITightText.new()
	StringA:setLeftRight( true, false, 65, 376.33 )
	StringA:setTopBottom( false, true, -24.5, -4.5 )
	StringA:setRGB( 0.87, 0.9, 0.9 )
	StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	StringA:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StringA:setLetterSpacing( 0.5 )
	self:addElement( StringA )
	self.StringA = StringA
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -84, -56 )
	Image3:setTopBottom( false, true, -4.5, -0.5 )
	Image3:setYRot( -180 )
	Image3:setZoom( 5 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 0 )
				self.clipFinished( StringA, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
			end
		},
		AddControllerState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StringA:completeAnimation()
				self.StringA:setAlpha( 1 )
				self.clipFinished( StringA, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

