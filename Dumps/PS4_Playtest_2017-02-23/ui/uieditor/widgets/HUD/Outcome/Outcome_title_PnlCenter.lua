require( "ui.uieditor.widgets.HUD.Outcome.Outcome_title_PnlCenterInt" )

CoD.Outcome_title_PnlCenter = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlCenter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlCenter )
	self.id = "Outcome_title_PnlCenter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1051 )
	self:setTopBottom( 0, 0, 0, 82 )
	
	local OutcometitlePnlCenterInt = CoD.Outcome_title_PnlCenterInt.new( menu, controller )
	OutcometitlePnlCenterInt:setLeftRight( 0, 1, 0, 0 )
	OutcometitlePnlCenterInt:setTopBottom( 0, 0, 0, 82 )
	OutcometitlePnlCenterInt:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	OutcometitlePnlCenterInt:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( OutcometitlePnlCenterInt )
	self.OutcometitlePnlCenterInt = OutcometitlePnlCenterInt
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.OutcometitlePnlCenterInt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

