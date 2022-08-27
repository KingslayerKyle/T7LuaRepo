-- a416252f1117e9935b188797ff293c7d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.MP_HardcoreScorestreakWidget = InheritFrom( LUI.UIElement )
CoD.MP_HardcoreScorestreakWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MP_HardcoreScorestreakWidget )
	self.id = "MP_HardcoreScorestreakWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, -1 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local text = LUI.UITightText.new()
	text:setLeftRight( true, false, 10, 193 )
	text:setTopBottom( true, false, 0, 25 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 2 )
				local PanelFrame2 = function ( Panel, event )
					local PanelFrame3 = function ( Panel, event )
						local PanelFrame4 = function ( Panel, event )
							if not event.interrupted then
								Panel:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
							end
							Panel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Panel, event )
							else
								Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PanelFrame4( Panel, event )
							return 
						else
							Panel:beginAnimation( "keyframe", 1769, false, false, CoD.TweenType.Linear )
							Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame4 )
						end
					end
					
					if event.interrupted then
						PanelFrame3( Panel, event )
						return 
					else
						Panel:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Panel:setAlpha( 1 )
						Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame3 )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local f4_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							if not f10_arg1.interrupted then
								f10_arg0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
							end
							f10_arg0:setAlpha( 0 )
							if f10_arg1.interrupted then
								self.clipFinished( f10_arg0, f10_arg1 )
							else
								f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 1719, false, false, CoD.TweenType.Linear )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 1 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				text:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				text:setAlpha( 0 )
				text:registerEventHandler( "transition_complete_keyframe", f4_local1 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

