-- d7e45409e2ef47466f712cfe391cb8c1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Outcome.Outcome_title_PnlURInt" )

CoD.Outcome_title_PnlUR = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlUR.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlUR )
	self.id = "Outcome_title_PnlUR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 28 )
	self.anyChildUsesUpdateState = true
	
	local OutcometitlePnlURInt = CoD.Outcome_title_PnlURInt.new( menu, controller )
	OutcometitlePnlURInt:setLeftRight( false, false, -13.5, 14 )
	OutcometitlePnlURInt:setTopBottom( false, false, -14, 13.5 )
	OutcometitlePnlURInt:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	OutcometitlePnlURInt:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( OutcometitlePnlURInt )
	self.OutcometitlePnlURInt = OutcometitlePnlURInt
	
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
		element.OutcometitlePnlURInt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

