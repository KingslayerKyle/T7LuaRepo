-- 69b0968ca5aa1249c5109a5b96ede624
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanel" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsoleText" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsoleIcon" )

CoD.CenterConsoleEntry = InheritFrom( LUI.UIElement )
CoD.CenterConsoleEntry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CenterConsoleEntry )
	self.id = "CenterConsoleEntry"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 740 )
	self:setTopBottom( true, false, 0, 22 )
	
	local Panel = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, false, 0, 22 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Text1 = CoD.CenterConsoleText.new( menu, controller )
	Text1:setLeftRight( false, false, 35, 370 )
	Text1:setTopBottom( false, false, -13, 13 )
	Text1:setRGB( 1, 0, 0 )
	Text1:setAlpha( 0.9 )
	Text1:linkToElementModel( self, "text1color", true, function ( model )
		local text1color = Engine.GetModelValue( model )
		if text1color then
			Text1.Text:setRGB( ConsoleColorFromIndex( controller, text1color ) )
		end
	end )
	Text1:linkToElementModel( self, "text1", true, function ( model )
		local text1 = Engine.GetModelValue( model )
		if text1 then
			Text1.Text:setText( Engine.Localize( text1 ) )
		end
	end )
	self:addElement( Text1 )
	self.Text1 = Text1
	
	local Icon1 = CoD.CenterConsoleIcon.new( menu, controller )
	Icon1:setLeftRight( false, false, 9, 35 )
	Icon1:setTopBottom( false, false, -13, 13 )
	Icon1:linkToElementModel( self, "icon1", true, function ( model )
		local icon1 = Engine.GetModelValue( model )
		if icon1 then
			Icon1.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( icon1 ) ) )
		end
	end )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Text0 = CoD.CenterConsoleText.new( menu, controller )
	Text0:setLeftRight( false, false, -344, 9 )
	Text0:setTopBottom( false, false, -13, 13 )
	Text0:linkToElementModel( self, "text0color", true, function ( model )
		local text0color = Engine.GetModelValue( model )
		if text0color then
			Text0.Text:setRGB( ConsoleColorFromIndex( controller, text0color ) )
		end
	end )
	Text0:linkToElementModel( self, "text0", true, function ( model )
		local text0 = Engine.GetModelValue( model )
		if text0 then
			Text0.Text:setText( Engine.Localize( text0 ) )
		end
	end )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	local Icon0 = CoD.CenterConsoleIcon.new( menu, controller )
	Icon0:setLeftRight( false, false, -370, -344 )
	Icon0:setTopBottom( false, false, -13, 13 )
	Icon0:linkToElementModel( self, "icon0", true, function ( model )
		local icon0 = Engine.GetModelValue( model )
		if icon0 then
			Icon0.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( icon0 ) ) )
		end
	end )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					Panel:setRGB( 0, 0, 0 )
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setRGB( 0, 0, 0 )
				self.Panel:setAlpha( 0.4 )
				PanelFrame2( Panel, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local PanelFrame2 = function ( Panel, event )
					local PanelFrame3 = function ( Panel, event )
						local PanelFrame4 = function ( Panel, event )
							local PanelFrame5 = function ( Panel, event )
								local PanelFrame6 = function ( Panel, event )
									local PanelFrame7 = function ( Panel, event )
										local PanelFrame8 = function ( Panel, event )
											local PanelFrame9 = function ( Panel, event )
												local PanelFrame10 = function ( Panel, event )
													if not event.interrupted then
														Panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Panel:setRGB( 0, 0, 0 )
													Panel:setAlpha( 0.4 )
													if event.interrupted then
														self.clipFinished( Panel, event )
													else
														Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PanelFrame10( Panel, event )
													return 
												else
													Panel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame10 )
												end
											end
											
											if event.interrupted then
												PanelFrame9( Panel, event )
												return 
											else
												Panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Panel:setAlpha( 0.1 )
												Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame9 )
											end
										end
										
										if event.interrupted then
											PanelFrame8( Panel, event )
											return 
										else
											Panel:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame8 )
										end
									end
									
									if event.interrupted then
										PanelFrame7( Panel, event )
										return 
									else
										Panel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Panel:setRGB( 0, 0, 0 )
										Panel:setAlpha( 0.4 )
										Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame7 )
									end
								end
								
								if event.interrupted then
									PanelFrame6( Panel, event )
									return 
								else
									Panel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Panel:setRGB( 0.33, 0.33, 0.33 )
									Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame6 )
								end
							end
							
							if event.interrupted then
								PanelFrame5( Panel, event )
								return 
							else
								Panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Panel:setAlpha( 0.1 )
								Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame5 )
							end
						end
						
						if event.interrupted then
							PanelFrame4( Panel, event )
							return 
						else
							Panel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame4 )
						end
					end
					
					if event.interrupted then
						PanelFrame3( Panel, event )
						return 
					else
						Panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Panel:setAlpha( 0.4 )
						Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame3 )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setRGB( 1, 1, 1 )
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.Text1:close()
		element.Icon1:close()
		element.Text0:close()
		element.Icon0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

