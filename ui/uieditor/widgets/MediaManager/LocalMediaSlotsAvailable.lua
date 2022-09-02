-- 9a09c54129de0e2ed05719bb7ab6054e
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.MediaManagerGetQuota( controller, CoD.FileshareUtility.GetCurrentCategory() )
	local f1_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager" ), "slotsAvailable" )
	if f1_local0 ~= nil then
		Engine.SetModelValue( f1_local1, f1_local0.categorySlotsAvailable )
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
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 30 )
	
	local CountLowBG = LUI.UIImage.new()
	CountLowBG:setLeftRight( true, false, 0, 57 )
	CountLowBG:setTopBottom( true, false, 0, 30 )
	CountLowBG:setRGB( 1, 0.22, 0.22 )
	CountLowBG:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local currentCategoryQuotaCategorySlotsAvailable = Engine.GetModelValue( model )
		if currentCategoryQuotaCategorySlotsAvailable then
			CountLowBG:setAlpha( FileshareGetSlotCountLowBGAlpha( currentCategoryQuotaCategorySlotsAvailable ) )
		end
	end )
	self:addElement( CountLowBG )
	self.CountLowBG = CountLowBG
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( true, false, 0, 57 )
	CountBG:setTopBottom( true, false, 0, 30 )
	CountBG:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota.categorySlotsAvailable", function ( model )
		local currentCategoryQuotaCategorySlotsAvailable = Engine.GetModelValue( model )
		if currentCategoryQuotaCategorySlotsAvailable then
			CountBG:setAlpha( FileshareGetSlotCountBGAlpha( currentCategoryQuotaCategorySlotsAvailable ) )
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
	LblSlotsAvailable:subscribeToGlobalModel( controller, "MediaManager", "slotsAvailable", function ( model )
		local slotsAvailable = Engine.GetModelValue( model )
		if slotsAvailable then
			LblSlotsAvailable:setText( Engine.Localize( FileshareGetSlotString( slotsAvailable ) ) )
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
	TxtSlots:subscribeToGlobalModel( controller, "MediaManager", "slotsAvailable", function ( model )
		local slotsAvailable = Engine.GetModelValue( model )
		if slotsAvailable then
			TxtSlots:setText( Engine.Localize( slotsAvailable ) )
		end
	end )
	TxtSlots:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			UpdateSlotCountText( self, element, controller, Enum.StorageFileType.STORAGE_EMBLEMS )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( TxtSlots )
	self.TxtSlots = TxtSlots
	
	local WaitingBG = LUI.UIImage.new()
	WaitingBG:setLeftRight( true, false, 0, 290 )
	WaitingBG:setTopBottom( true, false, 0, 30 )
	WaitingBG:setRGB( 0, 0, 0 )
	WaitingBG:setAlpha( 0 )
	self:addElement( WaitingBG )
	self.WaitingBG = WaitingBG
	
	local LblWaiting = LUI.UITightText.new()
	LblWaiting:setLeftRight( true, false, 2.65, 230.65 )
	LblWaiting:setTopBottom( true, false, 2.5, 27.5 )
	LblWaiting:setAlpha( 0 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CountLowBG:close()
		element.CountBG:close()
		element.LblSlotsAvailable:close()
		element.TxtSlots:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

