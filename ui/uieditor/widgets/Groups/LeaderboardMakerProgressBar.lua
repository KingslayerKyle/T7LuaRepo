-- 09f826e605fe31099ae0e85701d3e86c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.LeaderboardMakerProgressBarSteps" )

CoD.LeaderboardMakerProgressBar = InheritFrom( LUI.UIElement )
CoD.LeaderboardMakerProgressBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardMakerProgressBar )
	self.id = "LeaderboardMakerProgressBar"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Step = LUI.UITightText.new()
	Step:setLeftRight( true, false, 0, 39 )
	Step:setTopBottom( true, false, 3.5, 21.5 )
	Step:setAlpha( 0.7 )
	Step:setText( Engine.Localize( "GROUPS_STEP_CAPS" ) )
	Step:setTTF( "fonts/escom.ttf" )
	Step:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Step:setShaderVector( 0, 0.08, 0, 0, 0 )
	Step:setShaderVector( 1, 0, 0, 0, 0 )
	Step:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( Step )
	self.Step = Step
	
	local spacer2 = LUI.UIImage.new()
	spacer2:setLeftRight( true, false, 39, 56 )
	spacer2:setTopBottom( true, false, 0, 27 )
	spacer2:setAlpha( 0 )
	self:addElement( spacer2 )
	self.spacer2 = spacer2
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 56, 63 )
	spacer:setTopBottom( true, false, 2, 23 )
	spacer:setAlpha( 0.5 )
	spacer:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	spacer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( spacer )
	self.spacer = spacer
	
	local spacer20 = LUI.UIImage.new()
	spacer20:setLeftRight( true, false, 63, 74.25 )
	spacer20:setTopBottom( true, false, 0, 27 )
	spacer20:setAlpha( 0 )
	self:addElement( spacer20 )
	self.spacer20 = spacer20
	
	local LeaderboardMakerProgressBarSteps = CoD.LeaderboardMakerProgressBarSteps.new( menu, controller )
	LeaderboardMakerProgressBarSteps:setLeftRight( true, false, 74.25, 291.25 )
	LeaderboardMakerProgressBarSteps:setTopBottom( true, false, 0, 25 )
	self:addElement( LeaderboardMakerProgressBarSteps )
	self.LeaderboardMakerProgressBarSteps = LeaderboardMakerProgressBarSteps
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeaderboardMakerProgressBarSteps:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

