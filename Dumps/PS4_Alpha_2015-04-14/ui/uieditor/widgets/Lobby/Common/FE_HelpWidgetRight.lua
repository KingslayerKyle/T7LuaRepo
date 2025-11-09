require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )

CoD.FE_HelpWidgetRight = InheritFrom( LUI.UIElement )
CoD.FE_HelpWidgetRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_HelpWidgetRight )
	self.id = "FE_HelpWidgetRight"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 159 )
	self:setTopBottom( true, false, 0, 46 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 402 )
	FEButtonPanel0:setTopBottom( true, false, -21, 13 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 402 )
	FETitleNumBrdr0:setTopBottom( true, true, -21, -33 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	FETitleNumBrdr0:setAlpha( 0.55 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 1, -1 )
	FETitleLineL:setTopBottom( false, false, -2, 2 )
	FETitleLineL:setRGB( 1, 1, 1 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 22, 46 )
	buttonPromptImage:setTopBottom( true, false, -16, 8 )
	buttonPromptImage:setRGB( 1, 1, 1 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	buttonPromptImage:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 49, 146 )
	label:setTopBottom( false, false, -37, -17 )
	label:setRGB( 1, 1, 1 )
	label:setText( Engine.Localize( "Button Prompt" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( label )
	self.label = label
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 6, 14 )
	Arrow:setTopBottom( true, false, -8, 0 )
	Arrow:setRGB( 1, 1, 1 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ArrowFrame2 = function ( Arrow, event )
					local ArrowFrame3 = function ( Arrow, event )
						local ArrowFrame4 = function ( Arrow, event )
							local ArrowFrame5 = function ( Arrow, event )
								local ArrowFrame6 = function ( Arrow, event )
									if not event.interrupted then
										Arrow:beginAnimation( "keyframe", 17000, false, false, CoD.TweenType.Linear )
									end
									Arrow:setLeftRight( true, false, 6, 14 )
									Arrow:setTopBottom( true, false, 13, 21 )
									Arrow:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Arrow, event )
									else
										Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowFrame6( Arrow, event )
									return 
								else
									Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									Arrow:setLeftRight( true, false, 6, 14 )
									Arrow:setAlpha( 1 )
									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowFrame5( Arrow, event )
								return 
							else
								Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowFrame4( Arrow, event )
							return 
						else
							Arrow:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
							Arrow:setLeftRight( true, false, 11, 19 )
							Arrow:setAlpha( 0.55 )
							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFrame3( Arrow, event )
						return 
					else
						Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame3 )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 6, 14 )
				self.Arrow:setTopBottom( true, false, 13, 21 )
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.FETitleNumBrdr0:close()
		self.FETitleLineL:close()
		self.buttonPromptImage:close()
		CoD.FE_HelpWidgetRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

