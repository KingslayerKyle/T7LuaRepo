CoD.StarterPackWatermark = InheritFrom( LUI.UIElement )
CoD.StarterPackWatermark.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StarterPackWatermark )
	self.id = "StarterPackWatermark"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 17 )
	
	local StarterPackWatermark = LUI.UIText.new()
	StarterPackWatermark:setLeftRight( true, true, 0, 0 )
	StarterPackWatermark:setTopBottom( true, false, 0, 18 )
	StarterPackWatermark:setText( Engine.Localize( "PLATFORM_STARTER_PACK_WATERMARK" ) )
	StarterPackWatermark:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StarterPackWatermark:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	StarterPackWatermark:setShaderVector( 0, 0.07, 0, 0, 0 )
	StarterPackWatermark:setShaderVector( 1, -1.31, 0, 0, 0 )
	StarterPackWatermark:setShaderVector( 2, 0.71, 0, 0, 0 )
	StarterPackWatermark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StarterPackWatermark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	StarterPackWatermark:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		ScaleWidgetToLabel( self, element, 0 )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( StarterPackWatermark, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( StarterPackWatermark )
	self.StarterPackWatermark = StarterPackWatermark
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				StarterPackWatermark:completeAnimation()
				self.StarterPackWatermark:setAlpha( 1 )
				self.clipFinished( StarterPackWatermark, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				StarterPackWatermark:completeAnimation()
				self.StarterPackWatermark:setAlpha( 0 )
				self.clipFinished( StarterPackWatermark, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsStarterPackWatermarkHidden( menu, controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

