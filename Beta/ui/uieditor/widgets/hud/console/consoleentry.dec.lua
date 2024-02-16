require( "ui.uieditor.widgets.HUD.Console.ConsoleText" )
require( "ui.uieditor.widgets.HUD.Console.ConsoleIcon" )

CoD.ConsoleEntry = InheritFrom( LUI.UIElement )
CoD.ConsoleEntry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ConsoleEntry )
	self.id = "ConsoleEntry"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 690 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, true, -7, 9 )
	Panel:setTopBottom( true, false, -1, 15 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	Panel:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelfull" ) )
	Panel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Panel:setShaderVector( 0, 0.02, 0.25, 0, 0 )
	Panel:setupNineSliceShader( 16, 4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Text1 = CoD.ConsoleText.new( menu, controller )
	Text1:setLeftRight( true, false, 360, 690 )
	Text1:setTopBottom( true, false, 0, 14 )
	Text1:linkToElementModel( self, "text1color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text1.Text:setRGB( ConsoleColorFromIndex( modelValue ) )
		end
	end )
	Text1:linkToElementModel( self, "text1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text1.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text1 )
	self.Text1 = Text1
	
	local Icon1 = CoD.ConsoleIcon.new( menu, controller )
	Icon1:setLeftRight( true, false, 345, 360 )
	Icon1:setTopBottom( true, false, 0, 14 )
	Icon1:linkToElementModel( self, "icon1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon1.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( modelValue ) ) )
		end
	end )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Text0 = CoD.ConsoleText.new( menu, controller )
	Text0:setLeftRight( true, false, 15, 345 )
	Text0:setTopBottom( true, false, 0, 14 )
	Text0:linkToElementModel( self, "text0color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text0.Text:setRGB( ConsoleColorFromIndex( modelValue ) )
		end
	end )
	Text0:linkToElementModel( self, "text0", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text0.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	local Icon0 = CoD.ConsoleIcon.new( menu, controller )
	Icon0:setLeftRight( true, false, 0, 15 )
	Icon0:setTopBottom( true, false, 0, 14 )
	Icon0:linkToElementModel( self, "icon0", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon0.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( modelValue ) ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Text1:close()
		self.Icon1:close()
		self.Text0:close()
		self.Icon0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

