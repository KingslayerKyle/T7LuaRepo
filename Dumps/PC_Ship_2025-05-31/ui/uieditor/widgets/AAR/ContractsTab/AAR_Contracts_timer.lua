CoD.AAR_Contracts_timer = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_timer.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 9
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_timer )
	self.id = "AAR_Contracts_timer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 19 )
	
	local Weekly = LUI.UITightText.new()
	Weekly:setLeftRight( true, false, 0, 53 )
	Weekly:setTopBottom( true, false, 0, 19 )
	Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	Weekly:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Weekly:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Weekly:setShaderVector( 0, 0.03, 0, 0, 0 )
	Weekly:setShaderVector( 1, 0.06, 0, 0, 0 )
	Weekly:setShaderVector( 2, 1, 0, 0, 0 )
	Weekly:setLetterSpacing( 0.5 )
	self:addElement( Weekly )
	self.Weekly = Weekly
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, false, 62, 151 )
	Timer:setTopBottom( true, false, 1, 19 )
	Timer:setRGB( 0.46, 0.8, 0.75 )
	Timer:setText( Engine.Localize( "3 DAYS- 14:15:20" ) )
	Timer:setTTF( "fonts/default.ttf" )
	self:addElement( Timer )
	self.Timer = Timer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Timer:completeAnimation()
				self.Timer:setAlpha( 1 )
				self.clipFinished( Timer, {} )
			end
		},
		HideTimer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

