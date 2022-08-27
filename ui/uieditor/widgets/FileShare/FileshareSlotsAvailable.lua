-- 2fecb5dcb757d4d90c09ecc78de8b5da
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "currentCategoryQuota" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.FileshareUtility.UpdateCurrentQuota( f2_arg1 )
	f2_arg0.fileshareReadySubscription = f2_arg0:subscribeToGlobalModel( f2_arg1, "FileshareRoot", "ready", function ( model )
		CoD.FileshareUtility.UpdateCurrentQuota( f2_arg1 )
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
	self:addElement( CountLowBG )
	self.CountLowBG = CountLowBG
	
	local CountBG = LUI.UIImage.new()
	CountBG:setLeftRight( true, false, 0, 57 )
	CountBG:setTopBottom( true, false, 0, 30 )
	CountBG:setAlpha( 0 )
	self:addElement( CountBG )
	self.CountBG = CountBG
	
	local TextBG = LUI.UIImage.new()
	TextBG:setLeftRight( true, false, 57, 237 )
	TextBG:setTopBottom( true, false, 0, 30 )
	TextBG:setRGB( 0, 0, 0 )
	self:addElement( TextBG )
	self.TextBG = TextBG
	
	local LblSlotsAvailable = LUI.UITightText.new()
	LblSlotsAvailable:setLeftRight( true, false, 60.99, 237.01 )
	LblSlotsAvailable:setTopBottom( true, false, 3, 27 )
	LblSlotsAvailable:setTTF( "fonts/default.ttf" )
	LblSlotsAvailable:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota", function ( model )
		local currentCategoryQuota = Engine.GetModelValue( model )
		if currentCategoryQuota then
			LblSlotsAvailable:setText( Engine.Localize( FileshareGetSlotString( currentCategoryQuota ) ) )
		end
	end )
	self:addElement( LblSlotsAvailable )
	self.LblSlotsAvailable = LblSlotsAvailable
	
	local TxtSlots = LUI.UIText.new()
	TxtSlots:setLeftRight( true, false, 0, 57 )
	TxtSlots:setTopBottom( true, false, 3, 27 )
	TxtSlots:setRGB( 0, 0, 0 )
	TxtSlots:setTTF( "fonts/default.ttf" )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TxtSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TxtSlots:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategoryQuota", function ( model )
		local currentCategoryQuota = Engine.GetModelValue( model )
		if currentCategoryQuota then
			TxtSlots:setText( Engine.Localize( currentCategoryQuota ) )
		end
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
	LblWaiting:setTopBottom( true, false, 3.5, 27.5 )
	LblWaiting:setAlpha( 0 )
	LblWaiting:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
	LblWaiting:setTTF( "fonts/default.ttf" )
	self:addElement( LblWaiting )
	self.LblWaiting = LblWaiting
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CountBG:completeAnimation()
				self.CountBG:setAlpha( 1 )
				self.clipFinished( CountBG, {} )
				LblSlotsAvailable:completeAnimation()
				self.LblSlotsAvailable:setLeftRight( true, false, 60.99, 237.01 )
				self.LblSlotsAvailable:setTopBottom( true, false, 3, 27 )
				self.clipFinished( LblSlotsAvailable, {} )
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
				self:setupElementClipCounter( 4 )
				CountBG:completeAnimation()
				self.CountBG:setAlpha( 0 )
				self.clipFinished( CountBG, {} )
				LblSlotsAvailable:completeAnimation()
				self.LblSlotsAvailable:setLeftRight( true, false, 60.99, 237.01 )
				self.LblSlotsAvailable:setTopBottom( true, false, 3, 27 )
				self.clipFinished( LblSlotsAvailable, {} )
				WaitingBG:completeAnimation()
				self.WaitingBG:setAlpha( 0 )
				self.clipFinished( WaitingBG, {} )
				LblWaiting:completeAnimation()
				self.LblWaiting:setAlpha( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LblSlotsAvailable:close()
		element.TxtSlots:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

