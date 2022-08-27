-- 0343b0da70e0ec01cf4c11ac98aa4faf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimHUDWidget" )

local PostLoadFunc = function ( self, controller, menu )
	if not Engine.GetModel( Engine.GetModelForController( controller ), "trainingSim" ) then
		local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "trainingSim" )
	end
end

CoD.CPTrainingSimHUDContainer = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimHUDContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimHUDContainer )
	self.id = "CPTrainingSimHUDContainer"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 140 )
	self.anyChildUsesUpdateState = true
	
	local CPTrainingSimHUDWidget0 = CoD.CPTrainingSimHUDWidget.new( menu, controller )
	CPTrainingSimHUDWidget0:setLeftRight( true, false, 0, 266 )
	CPTrainingSimHUDWidget0:setTopBottom( true, false, 0, 140 )
	self:addElement( CPTrainingSimHUDWidget0 )
	self.CPTrainingSimHUDWidget0 = CPTrainingSimHUDWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HudPause = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local CPTrainingSimHUDWidget0Frame2 = function ( CPTrainingSimHUDWidget0, event )
					if not event.interrupted then
						CPTrainingSimHUDWidget0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CPTrainingSimHUDWidget0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CPTrainingSimHUDWidget0, event )
					else
						CPTrainingSimHUDWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CPTrainingSimHUDWidget0:completeAnimation()
				self.CPTrainingSimHUDWidget0:setAlpha( 1 )
				CPTrainingSimHUDWidget0Frame2( CPTrainingSimHUDWidget0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPTrainingSimHUDWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

