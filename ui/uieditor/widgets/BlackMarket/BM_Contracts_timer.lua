-- d22e776d0e2ec4fca6012b0d3cff127a
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_timer = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_timer.new = function ( menu, controller )
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
	self:setClass( CoD.BM_Contracts_timer )
	self.id = "BM_Contracts_timer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 19 )
	
	local Weekly = LUI.UITightText.new()
	Weekly:setLeftRight( true, false, 0, 68 )
	Weekly:setTopBottom( true, false, 0, 18 )
	Weekly:setRGB( 0.94, 0.89, 0.59 )
	Weekly:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	Weekly:setTTF( "fonts/escom.ttf" )
	Weekly:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Weekly:setShaderVector( 0, 0.03, 0, 0, 0 )
	Weekly:setShaderVector( 1, 0.06, 0, 0, 0 )
	Weekly:setShaderVector( 2, 1, 0, 0, 0 )
	Weekly:setLetterSpacing( 2 )
	self:addElement( Weekly )
	self.Weekly = Weekly
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, false, 77, 166 )
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
