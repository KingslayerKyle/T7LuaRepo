-- ee6a09c153f5741bac7347274332a67f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Outcome.Outcome_title_PnlLineInt" )

CoD.Outcome_title_PnlLine = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlLine )
	self.id = "Outcome_title_PnlLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 23 )
	self:setTopBottom( true, false, 0, 4 )
	self.anyChildUsesUpdateState = true
	
	local OutcometitlePnlLineInt = CoD.Outcome_title_PnlLineInt.new( menu, controller )
	OutcometitlePnlLineInt:setLeftRight( false, false, -11.5, 11.5 )
	OutcometitlePnlLineInt:setTopBottom( false, false, -2, 2 )
	OutcometitlePnlLineInt:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	OutcometitlePnlLineInt:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( OutcometitlePnlLineInt )
	self.OutcometitlePnlLineInt = OutcometitlePnlLineInt
	
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
		element.OutcometitlePnlLineInt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

