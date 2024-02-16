local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.UpdateCurrentQuota( controller )
	self.fileshareReadySubscription = self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		CoD.FileshareUtility.UpdateCurrentQuota( controller )
	end )
end

CoD.FileshareSlotsAvailable = InheritFrom( LUI.UIElement )
CoD.FileshareSlotsAvailable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSlotsAvailable )
	self.id = "FileshareSlotsAvailable"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 237 )
	self:setTopBottom( true, false, 0, 30 )
	
	local CountLowBG = LUI.UIImage.new()
	CountLowBG:setLeftRight( true, false, 0, 57 )
	CountLowBG:setTopBottom( true, false, 0, 30 )
	CountLowBG:setRGB( 1, 0.22, 0.22 )
	CountLowBG:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CountLowBG:setAlpha( FileshareGetSlotCountLowBGAlpha( modelValue ) )
		end
	end )
	self:addElement( CountLowBG )
	self.CountLowBG = CountLowBG
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( true, false, 0, 57 )
	CountBG:setTopBottom( true, false, 0, 30 )
	CountBG:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CountBG:setAlpha( FileshareGetSlotCountBGAlpha( modelValue ) )
		end
	end )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local TextBG = LUI.UIImage.new()
	TextBG:setLeftRight( true, false, 57, 237 )
	TextBG:setTopBottom( true, false, 0, 30 )
	TextBG:setRGB( 0, 0, 0 )
	self:addElement( TextBG )
	self.TextBG = TextBG
	
	local LblSlotsAvailable = LUI.UITightText.new()
	LblSlotsAvailable:setLeftRight( true, false, 58.99, 235.01 )
	LblSlotsAvailable:setTopBottom( true, false, 0, 30 )
	LblSlotsAvailable:setTTF( "fonts/default.ttf" )
	LblSlotsAvailable:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblSlotsAvailable:setText( Engine.Localize( FileshareGetSlotString( modelValue ) ) )
		end
	end )
	self:addElement( LblSlotsAvailable )
	self.LblSlotsAvailable = LblSlotsAvailable
	
	local TxtSlots = LUI.UIText.new()
	TxtSlots:setLeftRight( true, false, 0, 57 )
	TxtSlots:setTopBottom( true, false, 0, 30 )
	TxtSlots:setRGB( 0, 0, 0 )
	TxtSlots:setTTF( "fonts/default.ttf" )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TxtSlots:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtSlots:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TxtSlots )
	self.TxtSlots = TxtSlots
	
	local WaitingBG = LUI.UIImage.new()
	WaitingBG:setLeftRight( true, false, 0, 290 )
	WaitingBG:setTopBottom( true, false, 0, 30 )
	WaitingBG:setRGB( 0, 0, 0 )
	self:addElement( WaitingBG )
	self.WaitingBG = WaitingBG
	
	local LblWaiting = LUI.UITightText.new()
	LblWaiting:setLeftRight( true, false, 2.65, 230.65 )
	LblWaiting:setTopBottom( true, false, 2.5, 27.5 )
	LblWaiting:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
	LblWaiting:setTTF( "fonts/default.ttf" )
	self:addElement( LblWaiting )
	self.LblWaiting = LblWaiting
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				WaitingBG:completeAnimation()
				self.WaitingBG:setAlpha( 0 )
				self.clipFinished( WaitingBG, {} )
				LblWaiting:completeAnimation()
				self.LblWaiting:setAlpha( 0 )
				self.clipFinished( LblWaiting, {} )
			end
		},
		Waiting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				WaitingBG:completeAnimation()
				self.WaitingBG:setAlpha( 1 )
				self.clipFinished( WaitingBG, {} )
				LblWaiting:completeAnimation()
				self.LblWaiting:setAlpha( 1 )
				self.clipFinished( LblWaiting, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Waiting",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CountLowBG:close()
		self.CountBG:close()
		self.LblSlotsAvailable:close()
		self.TxtSlots:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

