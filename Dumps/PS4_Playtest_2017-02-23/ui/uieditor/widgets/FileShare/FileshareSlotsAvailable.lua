local PreLoadFunc = function ( self, controller )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
end

local PostLoadFunc = function ( self, controller )
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
	self:setLeftRight( 0, 0, 0, 355 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local CountLowBG = LUI.UIImage.new()
	CountLowBG:setLeftRight( 0, 0, 0, 86 )
	CountLowBG:setTopBottom( 0, 0, 0, 45 )
	CountLowBG:setRGB( 1, 0.22, 0.22 )
	self:addElement( CountLowBG )
	self.CountLowBG = CountLowBG
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( 0, 0, 0, 86 )
	CountBG:setTopBottom( 0, 0, 0, 45 )
	CountBG:setAlpha( 0 )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local TextBG = LUI.UIImage.new()
	TextBG:setLeftRight( 0, 0, 85, 355 )
	TextBG:setTopBottom( 0, 0, 0, 45 )
	TextBG:setRGB( 0, 0, 0 )
	self:addElement( TextBG )
	self.TextBG = TextBG
	
	local LblSlotsAvailable = LUI.UITightText.new()
	LblSlotsAvailable:setLeftRight( 0, 0, 92, 356 )
	LblSlotsAvailable:setTopBottom( 0, 0, 4, 40 )
	LblSlotsAvailable:setTTF( "fonts/default.ttf" )
	LblSlotsAvailable:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblSlotsAvailable:setText( Engine.Localize( FileshareGetSlotString( modelValue ) ) )
		end
	end )
	self:addElement( LblSlotsAvailable )
	self.LblSlotsAvailable = LblSlotsAvailable
	
	local TxtSlots = LUI.UIText.new()
	TxtSlots:setLeftRight( 0, 0, 0, 86 )
	TxtSlots:setTopBottom( 0, 0, 4, 40 )
	TxtSlots:setRGB( 0, 0, 0 )
	TxtSlots:setTTF( "fonts/default.ttf" )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TxtSlots:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtSlots:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TxtSlots )
	self.TxtSlots = TxtSlots
	
	local WaitingBG = LUI.UIImage.new()
	WaitingBG:setLeftRight( 0, 0, 0, 435 )
	WaitingBG:setTopBottom( 0, 0, 0, 45 )
	WaitingBG:setRGB( 0, 0, 0 )
	WaitingBG:setAlpha( 0 )
	self:addElement( WaitingBG )
	self.WaitingBG = WaitingBG
	
	local LblWaiting = LUI.UITightText.new()
	LblWaiting:setLeftRight( 0, 0, 4, 346 )
	LblWaiting:setTopBottom( 0, 0, 5, 41 )
	LblWaiting:setAlpha( 0 )
	LblWaiting:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
	LblWaiting:setTTF( "fonts/default.ttf" )
	self:addElement( LblWaiting )
	self.LblWaiting = LblWaiting
	
	self.resetProperties = function ()
		CountBG:completeAnimation()
		WaitingBG:completeAnimation()
		LblWaiting:completeAnimation()
		CountBG:setAlpha( 0 )
		WaitingBG:setAlpha( 0 )
		LblWaiting:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CountBG:completeAnimation()
				self.CountBG:setAlpha( 1 )
				self.clipFinished( CountBG, {} )
			end
		},
		Waiting = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CountBG:completeAnimation()
				self.CountBG:setAlpha( 1 )
				self.clipFinished( CountBG, {} )
				WaitingBG:completeAnimation()
				self.WaitingBG:setAlpha( 1 )
				self.clipFinished( WaitingBG, {} )
				LblWaiting:completeAnimation()
				self.LblWaiting:setAlpha( 1 )
				self.clipFinished( LblWaiting, {} )
			end
		},
		NoSlots = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Waiting",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		},
		{
			stateName = "NoSlots",
			condition = function ( menu, element, event )
				return not FileshareShowcaseSlotsAvailable( controller )
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
		self.LblSlotsAvailable:close()
		self.TxtSlots:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

