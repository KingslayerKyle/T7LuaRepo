-- c85a3bd2723d80bde9e95342750bc66b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookBookIcon" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.ZM_Cookbook.ZM_Cookbook_RingWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f2_local1 = Engine.GetUnlockableInfoModelByIndex( modelValue, "Unlockables." .. modelValue, Enum.eModes.MODE_ZOMBIES )
		if f2_local1 then
			self.GobbleGumCookBookIcon:setModel( f2_local1 )
		end
	end )
end

CoD.Cookboook_ResultListItem = InheritFrom( LUI.UIElement )
CoD.Cookboook_ResultListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookboook_ResultListItem )
	self.id = "Cookboook_ResultListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 340 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 2 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local GobbleGumCookBookIcon = CoD.GobbleGumCookBookIcon.new( menu, controller )
	GobbleGumCookBookIcon:setLeftRight( true, false, 62.5, 243.5 )
	GobbleGumCookBookIcon:setTopBottom( true, false, 52.5, 233.5 )
	self:addElement( GobbleGumCookBookIcon )
	self.GobbleGumCookBookIcon = GobbleGumCookBookIcon
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( false, true, -165, 103 )
	Count:setTopBottom( true, true, 128.5, -182.5 )
	Count:setRGB( 0, 0, 0 )
	Count:setAlpha( 0.9 )
	Count:setTTF( "fonts/default.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Count:linkToElementModel( self, "count", true, function ( model )
		local count = Engine.GetModelValue( model )
		if count then
			Count:setText( Engine.Localize( count ) )
		end
	end )
	self:addElement( Count )
	self.Count = Count
	
	local ZMCookbookRingWidget = CoD.ZM_Cookbook_RingWidget.new( menu, controller )
	ZMCookbookRingWidget:setLeftRight( true, false, 47.89, 252.89 )
	ZMCookbookRingWidget:setTopBottom( true, false, 40.5, 245.5 )
	ZMCookbookRingWidget:setAlpha( 0.7 )
	ZMCookbookRingWidget.ring:setShaderVector( 0, 0.7, 0, 0, 0 )
	ZMCookbookRingWidget:linkToElementModel( self, nil, false, function ( model )
		ZMCookbookRingWidget:setModel( model, controller )
	end )
	self:addElement( ZMCookbookRingWidget )
	self.ZMCookbookRingWidget = ZMCookbookRingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMCookbookRingWidget:completeAnimation()
				self.ZMCookbookRingWidget:setAlpha( 0.7 )
				self.clipFinished( ZMCookbookRingWidget, {} )
			end
		},
		RecipeResult = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GobbleGumCookBookIcon:completeAnimation()
				self.GobbleGumCookBookIcon:setAlpha( 1 )
				self.GobbleGumCookBookIcon:setScale( 1 )
				self.clipFinished( GobbleGumCookBookIcon, {} )
				ZMCookbookRingWidget:completeAnimation()
				self.ZMCookbookRingWidget:setAlpha( 0 )
				self.clipFinished( ZMCookbookRingWidget, {} )
			end,
			Animate = function ()
				self:setupElementClipCounter( 2 )
				local f8_local0 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						if not f10_arg1.interrupted then
							f10_arg0:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Bounce )
						end
						f10_arg0:setScale( 1 )
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
						f9_arg0:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
						f9_arg0:setScale( 0 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				GobbleGumCookBookIcon:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
				GobbleGumCookBookIcon:setScale( 1 )
				GobbleGumCookBookIcon:registerEventHandler( "transition_complete_keyframe", f8_local0 )
				local ZMCookbookRingWidgetFrame2 = function ( ZMCookbookRingWidget, event )
					local ZMCookbookRingWidgetFrame3 = function ( ZMCookbookRingWidget, event )
						local ZMCookbookRingWidgetFrame4 = function ( ZMCookbookRingWidget, event )
							local ZMCookbookRingWidgetFrame5 = function ( ZMCookbookRingWidget, event )
								if not event.interrupted then
									ZMCookbookRingWidget:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
									ZMCookbookRingWidget.ring:beginAnimation( "subkeyframe", 690, false, false, CoD.TweenType.Linear )
								end
								ZMCookbookRingWidget:setAlpha( 1 )
								ZMCookbookRingWidget.ring:setShaderVector( 0, 0.87, 0.87, 0, 0 )
								if event.interrupted then
									self.clipFinished( ZMCookbookRingWidget, event )
								else
									ZMCookbookRingWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZMCookbookRingWidgetFrame5( ZMCookbookRingWidget, event )
								return 
							else
								ZMCookbookRingWidget:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								ZMCookbookRingWidget:registerEventHandler( "transition_complete_keyframe", ZMCookbookRingWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							ZMCookbookRingWidgetFrame4( ZMCookbookRingWidget, event )
							return 
						else
							ZMCookbookRingWidget:beginAnimation( "keyframe", 1009, true, true, CoD.TweenType.Linear )
							ZMCookbookRingWidget.ring:beginAnimation( "subkeyframe", 1009, true, true, CoD.TweenType.Linear )
							ZMCookbookRingWidget.ring:setShaderVector( 0, 0.87, 0, 0, 0 )
							ZMCookbookRingWidget:registerEventHandler( "transition_complete_keyframe", ZMCookbookRingWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						ZMCookbookRingWidgetFrame3( ZMCookbookRingWidget, event )
						return 
					else
						ZMCookbookRingWidget:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ZMCookbookRingWidget:registerEventHandler( "transition_complete_keyframe", ZMCookbookRingWidgetFrame3 )
					end
				end
				
				ZMCookbookRingWidget:completeAnimation()
				ZMCookbookRingWidget.ring:completeAnimation()
				self.ZMCookbookRingWidget:setAlpha( 1 )
				self.ZMCookbookRingWidget.ring:setShaderVector( 0, 0, 0, 0, 0 )
				ZMCookbookRingWidgetFrame2( ZMCookbookRingWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "RecipeResult",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "GobbleGumRecipe" )
			end
		}
	} )
	ZMCookbookRingWidget.id = "ZMCookbookRingWidget"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ZMCookbookRingWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GobbleGumCookBookIcon:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.ZMCookbookRingWidget:close()
		element.Count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

