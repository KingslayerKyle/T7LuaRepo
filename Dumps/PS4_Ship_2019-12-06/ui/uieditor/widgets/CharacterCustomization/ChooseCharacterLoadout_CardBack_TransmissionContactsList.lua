require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_ContactListEntry" )

CoD.ChooseCharacterLoadout_CardBack_TransmissionContactsList = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_TransmissionContactsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_TransmissionContactsList )
	self.id = "ChooseCharacterLoadout_CardBack_TransmissionContactsList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 290 )
	self.anyChildUsesUpdateState = true
	
	local contactsList = LUI.GridLayout.new( menu, controller, false, 0, 0, 10, 0, nil, nil, false, false, 0, 0, false, false )
	contactsList:setLeftRight( false, true, -128, 0 )
	contactsList:setTopBottom( true, false, 0, 290 )
	contactsList:setWidgetType( CoD.ChooseCharacterLoadout_CardBack_ContactListEntry )
	contactsList:setVerticalCount( 3 )
	contactsList:setSpacing( 10 )
	contactsList:linkToElementModel( self, "contactsListDatasource", true, function ( model )
		local contactsListDatasource = Engine.GetModelValue( model )
		if contactsListDatasource then
			contactsList:setDataSource( contactsListDatasource )
		end
	end )
	self:addElement( contactsList )
	self.contactsList = contactsList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				contactsList:completeAnimation()
				self.contactsList:setAlpha( 0 )
				self.clipFinished( contactsList, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 1 )
				local contactsListFrame2 = function ( contactsList, event )
					if not event.interrupted then
						contactsList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					contactsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( contactsList, event )
					else
						contactsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				contactsList:completeAnimation()
				self.contactsList:setAlpha( 0 )
				contactsListFrame2( contactsList, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				contactsList:completeAnimation()
				self.contactsList:setAlpha( 1 )
				self.clipFinished( contactsList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local contactsListFrame2 = function ( contactsList, event )
					if not event.interrupted then
						contactsList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					contactsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( contactsList, event )
					else
						contactsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				contactsList:completeAnimation()
				self.contactsList:setAlpha( 1 )
				contactsListFrame2( contactsList, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.contactsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

