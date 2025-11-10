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
	self:setLeftRight( true, false, 0, 701 )
	self:setTopBottom( true, false, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local OutcometitlePnlCenterInt = CoD.Outcome_title_PnlCenterInt.new( menu, controller )
	OutcometitlePnlCenterInt:setLeftRight( true, true, 0, 0 )
	OutcometitlePnlCenterInt:setTopBottom( true, false, 0, 54.9 )
	OutcometitlePnlCenterInt:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	OutcometitlePnlCenterInt:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( OutcometitlePnlCenterInt )
	self.OutcometitlePnlCenterInt = OutcometitlePnlCenterInt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		VictoryGreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DefeatRed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		OvertimeOrange = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OutcometitlePnlCenterInt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

