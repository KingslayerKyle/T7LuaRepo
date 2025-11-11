local PreLoadFunc = function ( self, controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local quota = Engine.MediaManagerGetQuota( controller, category )
	local mediaManagerModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager" )
	local slotsModel = Engine.CreateModel( mediaManagerModel, "slotsAvailable" )
	if quota ~= nil then
		Engine.SetModelValue( slotsModel, quota.categorySlotsAvailable )
	end
end

CoD.LocalMediaSlotsAvailable = InheritFrom( LUI.UIElement )
CoD.LocalMediaSlotsAvailable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LocalMediaSlotsAvailable )
	self.id = "LocalMediaSlotsAvailable"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local CountLowBG = LUI.UIImage.new()
	CountLowBG:setLeftRight( 0, 0, 0, 86 )
	CountLowBG:setTopBottom( 0, 0, 0, 45 )
	CountLowBG:setRGB( 1, 0.22, 0.22 )
	CountLowBG:setAlpha( FileshareGetSlotCountLowBGAlpha( 1 ) )
	self:addElement( CountLowBG )
	self.CountLowBG = CountLowBG
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( 0, 0, 0, 86 )
	CountBG:setTopBottom( 0, 0, 0, 45 )
	CountBG:setAlpha( FileshareGetSlotCountBGAlpha( 1 ) )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local TextBG = LUI.UIImage.new()
	TextBG:setLeftRight( 0, 0, 85, 355 )
	TextBG:setTopBottom( 0, 0, 0, 45 )
	TextBG:setRGB( 0, 0, 0 )
	self:addElement( TextBG )
	self.TextBG = TextBG
	
	local LblSlotsAvailable = LUI.UITightText.new()
	LblSlotsAvailable:setLeftRight( 0, 0, 88, 352 )
	LblSlotsAvailable:setTopBottom( 0, 0, 0, 45 )
	LblSlotsAvailable:setTTF( "fonts/default.ttf" )
	LblSlotsAvailable:subscribeToGlobalModel( controller, "MediaManager", "slotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblSlotsAvailable:setText( Engine.Localize( FileshareGetSlotString( modelValue ) ) )
		end
	end )
	self:addElement( LblSlotsAvailable )
	self.LblSlotsAvailable = LblSlotsAvailable
	
	local TxtSlots = LUI.UIText.new()
	TxtSlots:setLeftRight( 0, 0, 0, 86 )
	TxtSlots:setTopBottom( 0, 0, 0, 45 )
	TxtSlots:setRGB( 0, 0, 0 )
	TxtSlots:setTTF( "fonts/default.ttf" )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TxtSlots:subscribeToGlobalModel( controller, "MediaManager", "slotsAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TxtSlots:setText( Engine.Localize( modelValue ) )
		end
	end )
	TxtSlots:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			UpdateSlotCountText( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
	LblWaiting:setTopBottom( 0, 0, 3, 41 )
	LblWaiting:setAlpha( 0 )
	LblWaiting:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
	LblWaiting:setTTF( "fonts/default.ttf" )
	self:addElement( LblWaiting )
	self.LblWaiting = LblWaiting
	
	self.resetProperties = function ()
		WaitingBG:completeAnimation()
		LblWaiting:completeAnimation()
		WaitingBG:setAlpha( 0 )
		LblWaiting:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Waiting = {
			DefaultClip = function ()
				self.resetProperties()
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
		self.LblSlotsAvailable:close()
		self.TxtSlots:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

