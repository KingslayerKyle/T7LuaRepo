-- e6a4bf52e89def60e4cff141fd5e536f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_FooterLabel01" )

CoD.ChallengesNotification = InheritFrom( LUI.UIElement )
CoD.ChallengesNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChallengesNotification )
	self.id = "ChallengesNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -64, 64 )
	image:setTopBottom( true, false, 38, 166 )
	self:addElement( image )
	self.image = image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -204, 204 )
	Text:setTopBottom( true, false, 178, 208 )
	Text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 40, 40 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	local WeaponLevelUpNotificationFooterLabel01 = CoD.WeaponLevelUpNotification_FooterLabel01.new( menu, controller )
	WeaponLevelUpNotificationFooterLabel01:setLeftRight( false, false, -64, 64 )
	WeaponLevelUpNotificationFooterLabel01:setTopBottom( true, false, 208, 240 )
	self:addElement( WeaponLevelUpNotificationFooterLabel01 )
	self.WeaponLevelUpNotificationFooterLabel01 = WeaponLevelUpNotificationFooterLabel01
	
	self.image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			image:setImage( RegisterImage( icon ) )
		end
	end )
	self.Text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Text:setText( Engine.Localize( title ) )
		end
	end )
	self.WeaponLevelUpNotificationFooterLabel01:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			WeaponLevelUpNotificationFooterLabel01.WeaponLevelUpNotificationFooterBacking:setRGB( color )
		end
	end )
	self.WeaponLevelUpNotificationFooterLabel01:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			WeaponLevelUpNotificationFooterLabel01.SubText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local imageFrame2 = function ( image, event )
					if not event.interrupted then
						image:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					image:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( image, event )
					else
						image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				image:completeAnimation()
				self.image:setAlpha( 0 )
				imageFrame2( image, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				TextFrame2( Text, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 2 )

				local imageFrame2 = function ( image, event )
					if not event.interrupted then
						image:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					image:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( image, event )
					else
						image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				image:completeAnimation()
				self.image:setAlpha( 1 )
				imageFrame2( image, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponLevelUpNotificationFooterLabel01:close()
		element.image:close()
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
