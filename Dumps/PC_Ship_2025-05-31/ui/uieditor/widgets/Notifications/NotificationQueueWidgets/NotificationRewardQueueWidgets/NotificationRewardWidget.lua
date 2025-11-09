require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.IconRewardWidget" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardBorder" )

CoD.NotificationRewardWidget = InheritFrom( LUI.UIElement )
CoD.NotificationRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationRewardWidget )
	self.id = "NotificationRewardWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, true, -48, 0 )
	Background:setTopBottom( false, false, -24, 24 )
	Background:setRGB( 0.34, 0.34, 0.34 )
	Background:setAlpha( 0.8 )
	Background:setImage( RegisterImage( "uie_t7_hud_notficationbkgd" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ImageScanline = CoD.IconRewardWidget.new( menu, controller )
	ImageScanline:setLeftRight( true, false, 208, 256 )
	ImageScanline:setTopBottom( true, false, 8, 56 )
	ImageScanline.ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
	ImageScanline.ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
	ImageScanline.ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
	ImageScanline:linkToElementModel( self, nil, false, function ( model )
		ImageScanline:setModel( model, controller )
	end )
	ImageScanline:mergeStateConditions( {
		{
			stateName = "CallingCard",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "size", "CallingCard" )
			end
		}
	} )
	ImageScanline:linkToElementModel( ImageScanline, "size", true, function ( model )
		menu:updateElementState( ImageScanline, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "size"
		} )
	end )
	ImageScanline:linkToElementModel( ImageScanline, "icon", true, function ( model )
		menu:updateElementState( ImageScanline, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "icon"
		} )
	end )
	self:addElement( ImageScanline )
	self.ImageScanline = ImageScanline
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( false, true, -256, -55 )
	Text:setTopBottom( false, false, -10, 10 )
	Text:setTTF( "fonts/default.ttf" )
	self:addElement( Text )
	self.Text = Text
	
	local NotificationRewardBorder = CoD.NotificationRewardBorder.new( menu, controller )
	NotificationRewardBorder:setLeftRight( true, false, 206, 258 )
	NotificationRewardBorder:setTopBottom( true, false, 6, 58 )
	self:addElement( NotificationRewardBorder )
	self.NotificationRewardBorder = NotificationRewardBorder
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 168, 296 )
	highlight:setTopBottom( true, false, -32, 96 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	self.ImageScanline:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			ImageScanline.ImageScanline:setImage( RegisterImage( icon ) )
		end
	end )
	self.Text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Text:setText( title )
		end
	end )
	self.NotificationRewardBorder:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NotificationRewardBorder:setRGB( color )
		end
	end )
	self.highlight:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			highlight:setRGB( color )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local BackgroundFrame2 = function ( Background, event )
					local BackgroundFrame3 = function ( Background, event )
						local BackgroundFrame4 = function ( Background, event )
							if not event.interrupted then
								Background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
							end
							Background:setAlpha( 0.8 )
							Background:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Background, event )
							else
								Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BackgroundFrame4( Background, event )
							return 
						else
							Background:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							Background:setScale( 0.95 )
							Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame4 )
						end
					end
					
					if event.interrupted then
						BackgroundFrame3( Background, event )
						return 
					else
						Background:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
						Background:setAlpha( 0.8 )
						Background:setScale( 1 )
						Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame3 )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.Background:setScale( 3 )
				BackgroundFrame2( Background, {} )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					local ImageScanlineFrame3 = function ( ImageScanline, event )
						local ImageScanlineFrame4 = function ( ImageScanline, event )
							local ImageScanlineFrame5 = function ( ImageScanline, event )
								local ImageScanlineFrame6 = function ( ImageScanline, event )
									local ImageScanlineFrame7 = function ( ImageScanline, event )
										if not event.interrupted then
											ImageScanline:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											ImageScanline.ImageScanline:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
										end
										ImageScanline:setAlpha( 1 )
										ImageScanline:setScale( 1 )
										ImageScanline.ImageScanline:setShaderVector( 0, 1, 0, 0, 0 )
										ImageScanline.ImageScanline:setShaderVector( 1, 0.05, 0, 0, 0 )
										ImageScanline.ImageScanline:setShaderVector( 2, 0.01, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( ImageScanline, event )
										else
											ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ImageScanlineFrame7( ImageScanline, event )
										return 
									else
										ImageScanline:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										ImageScanline:setAlpha( 1 )
										ImageScanline:setScale( 1 )
										ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame7 )
									end
								end
								
								if event.interrupted then
									ImageScanlineFrame6( ImageScanline, event )
									return 
								else
									ImageScanline:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									ImageScanline:setAlpha( 0.81 )
									ImageScanline:setScale( 0.95 )
									ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame6 )
								end
							end
							
							if event.interrupted then
								ImageScanlineFrame5( ImageScanline, event )
								return 
							else
								ImageScanline:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								ImageScanline:setAlpha( 0.44 )
								ImageScanline:setScale( 1 )
								ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame5 )
							end
						end
						
						if event.interrupted then
							ImageScanlineFrame4( ImageScanline, event )
							return 
						else
							ImageScanline:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ImageScanline.ImageScanline:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
							ImageScanline:setAlpha( 0.25 )
							ImageScanline:setScale( 1.86 )
							ImageScanline.ImageScanline:setShaderVector( 0, 1, 0, 0, 0 )
							ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame4 )
						end
					end
					
					if event.interrupted then
						ImageScanlineFrame3( ImageScanline, event )
						return 
					else
						ImageScanline:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame3 )
					end
				end
				
				ImageScanline:completeAnimation()
				ImageScanline.ImageScanline:completeAnimation()
				self.ImageScanline:setAlpha( 0 )
				self.ImageScanline:setScale( 3 )
				self.ImageScanline.ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
				self.ImageScanline.ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
				self.ImageScanline.ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
				ImageScanlineFrame2( ImageScanline, {} )
				local NotificationRewardBorderFrame2 = function ( NotificationRewardBorder, event )
					local NotificationRewardBorderFrame3 = function ( NotificationRewardBorder, event )
						local NotificationRewardBorderFrame4 = function ( NotificationRewardBorder, event )
							if not event.interrupted then
								NotificationRewardBorder:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
							end
							NotificationRewardBorder:setAlpha( 1 )
							NotificationRewardBorder:setScale( 1 )
							if event.interrupted then
								self.clipFinished( NotificationRewardBorder, event )
							else
								NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							NotificationRewardBorderFrame4( NotificationRewardBorder, event )
							return 
						else
							NotificationRewardBorder:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							NotificationRewardBorder:setScale( 0.95 )
							NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", NotificationRewardBorderFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationRewardBorderFrame3( NotificationRewardBorder, event )
						return 
					else
						NotificationRewardBorder:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
						NotificationRewardBorder:setAlpha( 1 )
						NotificationRewardBorder:setScale( 1 )
						NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", NotificationRewardBorderFrame3 )
					end
				end
				
				NotificationRewardBorder:completeAnimation()
				self.NotificationRewardBorder:setAlpha( 0 )
				self.NotificationRewardBorder:setScale( 3 )
				NotificationRewardBorderFrame2( NotificationRewardBorder, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								highlight:setAlpha( 0 )
								highlight:setZRot( 360 )
								highlight:setScale( 1.5 )
								highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
								if event.interrupted then
									self.clipFinished( highlight, event )
								else
									highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								highlight:setAlpha( 0.5 )
								highlight:setZRot( 292.5 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 0.7 )
							highlight:setZRot( 157.5 )
							highlight:setScale( 1.5 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						highlight:setAlpha( 0.52 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 0 )
				self.highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				highlightFrame2( highlight, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 5 )
				local BackgroundFrame2 = function ( Background, event )
					local BackgroundFrame3 = function ( Background, event )
						local BackgroundFrame4 = function ( Background, event )
							local BackgroundFrame5 = function ( Background, event )
								if not event.interrupted then
									Background:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								Background:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Background, event )
								else
									Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BackgroundFrame5( Background, event )
								return 
							else
								Background:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								Background:setAlpha( 0.5 )
								Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame5 )
							end
						end
						
						if event.interrupted then
							BackgroundFrame4( Background, event )
							return 
						else
							Background:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							Background:setAlpha( 0 )
							Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame4 )
						end
					end
					
					if event.interrupted then
						BackgroundFrame3( Background, event )
						return 
					else
						Background:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Background:setAlpha( 1 )
						Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame3 )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0.9 )
				BackgroundFrame2( Background, {} )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					local ImageScanlineFrame3 = function ( ImageScanline, event )
						local ImageScanlineFrame4 = function ( ImageScanline, event )
							local ImageScanlineFrame5 = function ( ImageScanline, event )
								local ImageScanlineFrame6 = function ( ImageScanline, event )
									if not event.interrupted then
										ImageScanline:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
										ImageScanline.ImageScanline:beginAnimation( "subkeyframe", 39, false, true, CoD.TweenType.Bounce )
									end
									ImageScanline:setAlpha( 0 )
									ImageScanline.ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
									ImageScanline.ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
									ImageScanline.ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( ImageScanline, event )
									else
										ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImageScanlineFrame6( ImageScanline, event )
									return 
								else
									ImageScanline:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
									ImageScanline:setAlpha( 0.6 )
									ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame6 )
								end
							end
							
							if event.interrupted then
								ImageScanlineFrame5( ImageScanline, event )
								return 
							else
								ImageScanline:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
								ImageScanline:setAlpha( 0 )
								ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame5 )
							end
						end
						
						if event.interrupted then
							ImageScanlineFrame4( ImageScanline, event )
							return 
						else
							ImageScanline:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							ImageScanline.ImageScanline:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
							ImageScanline.ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
							ImageScanline.ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
							ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame4 )
						end
					end
					
					if event.interrupted then
						ImageScanlineFrame3( ImageScanline, event )
						return 
					else
						ImageScanline:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame3 )
					end
				end
				
				ImageScanline:completeAnimation()
				ImageScanline.ImageScanline:completeAnimation()
				self.ImageScanline:setAlpha( 1 )
				self.ImageScanline.ImageScanline:setShaderVector( 0, 0.05, 0, 0, 0 )
				self.ImageScanline.ImageScanline:setShaderVector( 1, 0.01, 0, 0, 0 )
				self.ImageScanline.ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
				ImageScanlineFrame2( ImageScanline, {} )
				local TextFrame2 = function ( Text, event )
					local TextFrame3 = function ( Text, event )
						local TextFrame4 = function ( Text, event )
							local TextFrame5 = function ( Text, event )
								if not event.interrupted then
									Text:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								Text:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Text, event )
								else
									Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TextFrame5( Text, event )
								return 
							else
								Text:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								Text:setAlpha( 0.6 )
								Text:registerEventHandler( "transition_complete_keyframe", TextFrame5 )
							end
						end
						
						if event.interrupted then
							TextFrame4( Text, event )
							return 
						else
							Text:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							Text:setAlpha( 0 )
							Text:registerEventHandler( "transition_complete_keyframe", TextFrame4 )
						end
					end
					
					if event.interrupted then
						TextFrame3( Text, event )
						return 
					else
						Text:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Text:registerEventHandler( "transition_complete_keyframe", TextFrame3 )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
				local NotificationRewardBorderFrame2 = function ( NotificationRewardBorder, event )
					local NotificationRewardBorderFrame3 = function ( NotificationRewardBorder, event )
						local NotificationRewardBorderFrame4 = function ( NotificationRewardBorder, event )
							local NotificationRewardBorderFrame5 = function ( NotificationRewardBorder, event )
								if not event.interrupted then
									NotificationRewardBorder:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								end
								NotificationRewardBorder:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( NotificationRewardBorder, event )
								else
									NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								NotificationRewardBorderFrame5( NotificationRewardBorder, event )
								return 
							else
								NotificationRewardBorder:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								NotificationRewardBorder:setAlpha( 0.6 )
								NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", NotificationRewardBorderFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationRewardBorderFrame4( NotificationRewardBorder, event )
							return 
						else
							NotificationRewardBorder:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Bounce )
							NotificationRewardBorder:setAlpha( 0 )
							NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", NotificationRewardBorderFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationRewardBorderFrame3( NotificationRewardBorder, event )
						return 
					else
						NotificationRewardBorder:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						NotificationRewardBorder:registerEventHandler( "transition_complete_keyframe", NotificationRewardBorderFrame3 )
					end
				end
				
				NotificationRewardBorder:completeAnimation()
				self.NotificationRewardBorder:setAlpha( 1 )
				NotificationRewardBorderFrame2( NotificationRewardBorder, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageScanline:close()
		element.NotificationRewardBorder:close()
		element.Text:close()
		element.highlight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

