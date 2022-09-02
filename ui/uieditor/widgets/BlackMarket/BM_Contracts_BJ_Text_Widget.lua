-- a670917ab458ef8e4043f159859ba59e
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_BJ_Text_Widget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_BJ_Text_Widget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 3
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_BJ_Text_Widget )
	self.id = "BM_Contracts_BJ_Text_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 211 )
	self:setTopBottom( true, false, 0, 17 )
	
	local Activated = LUI.UITightText.new()
	Activated:setLeftRight( true, false, 3.63, 58.63 )
	Activated:setTopBottom( true, false, 0, 17 )
	Activated:setRGB( 0.95, 0.55, 0.15 )
	Activated:setText( Engine.Localize( "MENU_ACTIVATED_CAPS" ) )
	Activated:setTTF( "fonts/default.ttf" )
	Activated:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Activated:setShaderVector( 0, 0.06, 0, 0, 0 )
	Activated:setShaderVector( 1, 0.03, 0, 0, 0 )
	Activated:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( Activated )
	self.Activated = Activated
	
	local TimeRemaining0 = LUI.UIText.new()
	TimeRemaining0:setLeftRight( true, false, 61.63, 207.38 )
	TimeRemaining0:setTopBottom( true, false, 0, 17 )
	TimeRemaining0:setRGB( 0.71, 0.71, 0.71 )
	TimeRemaining0:setText( Engine.Localize( "MENU_GAME_TIME_REMAINING" ) )
	TimeRemaining0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TimeRemaining0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TimeRemaining0:setShaderVector( 0, 0.06, 0, 0, 0 )
	TimeRemaining0:setShaderVector( 1, 0.03, 0, 0, 0 )
	TimeRemaining0:setShaderVector( 2, 1, 0, 0, 0 )
	TimeRemaining0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TimeRemaining0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeRemaining0 )
	self.TimeRemaining0 = TimeRemaining0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsBlackjackContractActive( controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

