require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0.m_preventFromBeingActive = true
	ScaleWidgetToLabelWrappedRightAlign( f1_arg0.hintText, f1_arg0.hintText.textCenterAlign, 10, 0 )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.LobbyMemberMP45 = InheritFrom( LUI.UIElement )
CoD.LobbyMemberMP45.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberMP45 )
	self.id = "LobbyMemberMP45"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 0, 24 )
	icon:setTopBottom( true, true, 0, 0 )
	icon:setImage( RegisterImage( "uie_pc_starter_pack_key_art_07_icon" ) )
	self:addElement( icon )
	self.icon = icon
	
	local hintText = CoD.ItemHintText.new( menu, controller )
	hintText:setLeftRight( false, true, -237, -29 )
	hintText:setTopBottom( true, false, 0, 24 )
	hintText:setRGB( 0.97, 0.47, 0 )
	hintText:setAlpha( 0 )
	hintText.textCenterAlign:setText( Engine.Localize( "PLATFORM_STARTER_PACK_PLAYER" ) )
	hintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	hintText:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( hintText )
	self.hintText = hintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setZRot( 0 )
				self.clipFinished( icon, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 0 )
				self.clipFinished( hintText, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.icon:setZRot( -90 )
				self.clipFinished( icon, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 1 )
				self.clipFinished( hintText, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 2 )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					icon:setAlpha( 0 )
					icon:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.icon:setZRot( 0 )
				iconFrame2( icon, {} )
				local hintTextFrame2 = function ( hintText, event )
					if not event.interrupted then
						hintText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					hintText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( hintText, event )
					else
						hintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				hintText:completeAnimation()
				self.hintText:setAlpha( 0 )
				hintTextFrame2( hintText, {} )
			end,
			LoseOver = function ()
				self:setupElementClipCounter( 2 )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					icon:setAlpha( 1 )
					icon:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.icon:setZRot( -90 )
				iconFrame2( icon, {} )
				local hintTextFrame2 = function ( hintText, event )
					if not event.interrupted then
						hintText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					hintText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( hintText, event )
					else
						hintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				hintText:completeAnimation()
				self.hintText:setAlpha( 1 )
				hintTextFrame2( hintText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

