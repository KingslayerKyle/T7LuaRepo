require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.AllocationSpentWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToElementModel( self, "allocationSpent", function ( model )
		UpdateAllocationBar( self, self.allocationSpent, controller )
	end )
end

CoD.ClassAllocation = InheritFrom( LUI.UIElement )
CoD.ClassAllocation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClassAllocation )
	self.id = "ClassAllocation"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 35 )
	self.anyChildUsesUpdateState = true
	
	local TitleNumBrdr = CoD.FE_TitleNumBrdr.new( menu, controller )
	TitleNumBrdr:setLeftRight( false, true, 473, -297 )
	TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
	TitleNumBrdr:setAlpha( 0.2 )
	self:addElement( TitleNumBrdr )
	self.TitleNumBrdr = TitleNumBrdr
	
	local allocationSpent = CoD.AllocationSpentWidget.new( menu, controller )
	allocationSpent:setLeftRight( false, true, -291, 36 )
	allocationSpent:setTopBottom( true, false, 1, 33 )
	allocationSpent.AllocationBar10:setAlpha( 0 )
	allocationSpent.AllocationBar11:setAlpha( 0 )
	allocationSpent.AllocationBar12:setAlpha( 0 )
	allocationSpent.AllocationBar13:setAlpha( 0 )
	allocationSpent.AllocationBar14:setAlpha( 0 )
	allocationSpent.AllocationBar15:setAlpha( 0 )
	allocationSpent.AllocationBar16:setAlpha( 0 )
	allocationSpent:linkToElementModel( self, nil, false, function ( model )
		allocationSpent:setModel( model, controller )
	end )
	allocationSpent:registerEventHandler( "update_class", function ( element, event )
		local retVal = nil
		UpdateAllocationBar( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( allocationSpent )
	self.allocationSpent = allocationSpent
	
	local TextBoxSlash = LUI.UIText.new()
	TextBoxSlash:setLeftRight( false, true, -72, -46 )
	TextBoxSlash:setTopBottom( true, false, 1, 33 )
	TextBoxSlash:setRGB( 0.58, 0.64, 0.65 )
	TextBoxSlash:setAlpha( 0.5 )
	TextBoxSlash:setText( Engine.Localize( "/" ) )
	TextBoxSlash:setTTF( "fonts/escom.ttf" )
	TextBoxSlash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBoxSlash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxSlash )
	self.TextBoxSlash = TextBoxSlash
	
	local totalCapacityLabel = LUI.UIText.new()
	totalCapacityLabel:setLeftRight( false, true, -45, -6 )
	totalCapacityLabel:setTopBottom( true, false, 3, 35 )
	totalCapacityLabel:setRGB( 0.84, 0.86, 0.87 )
	totalCapacityLabel:setText( Engine.Localize( GetMaxAllocationAmount( controller, "10" ) ) )
	totalCapacityLabel:setTTF( "fonts/escom.ttf" )
	totalCapacityLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalCapacityLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( totalCapacityLabel )
	self.totalCapacityLabel = totalCapacityLabel
	
	local capacityValueLabel = LUI.UIText.new()
	capacityValueLabel:setLeftRight( false, true, -109, -61 )
	capacityValueLabel:setTopBottom( true, false, 3, 35 )
	capacityValueLabel:setRGB( 0.84, 0.86, 0.87 )
	capacityValueLabel:setTTF( "fonts/escom.ttf" )
	capacityValueLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	capacityValueLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	capacityValueLabel:linkToElementModel( self, "allocationSpent", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			capacityValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( capacityValueLabel )
	self.capacityValueLabel = capacityValueLabel
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( false, true, -543, -304 )
	UnlockTokensWidget:setTopBottom( true, false, -1, 43 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	self.clipsPerState = {
		NoAllocationBar = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setAlpha( 0 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				self.allocationSpent:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				TextBoxSlash:completeAnimation()
				self.TextBoxSlash:setAlpha( 0 )
				self.clipFinished( TextBoxSlash, {} )
				totalCapacityLabel:completeAnimation()
				self.totalCapacityLabel:setAlpha( 0 )
				self.clipFinished( totalCapacityLabel, {} )
				capacityValueLabel:completeAnimation()
				self.capacityValueLabel:setAlpha( 0 )
				self.clipFinished( capacityValueLabel, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -239, 0 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 43 )
				self.UnlockTokensWidget:setAlpha( 1 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 473, -297 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -291, 36 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 0 )
				self.allocationSpent.AllocationBar11:setAlpha( 0 )
				self.allocationSpent.AllocationBar12:setAlpha( 0 )
				self.allocationSpent.AllocationBar13:setAlpha( 0 )
				self.allocationSpent.AllocationBar14:setAlpha( 0 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -543, -304 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 43 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc17 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 340, -430 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -424, -97 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.allocationSpent.AllocationBar15:setAlpha( 1 )
				self.allocationSpent.AllocationBar16:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -644, -454 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc16 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 359, -411 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -405, -78 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.allocationSpent.AllocationBar15:setAlpha( 1 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -625, -435 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc15 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 378, -392 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -386, -59 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -606, -416 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc14 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 397, -373 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -367, -40 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 0 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -587, -397 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc13 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 416, -354 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -348, -21 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 0 )
				self.allocationSpent.AllocationBar14:setAlpha( 0 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -568, -378 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc12 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 435, -335 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -329, -2 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 0 )
				self.allocationSpent.AllocationBar13:setAlpha( 0 )
				self.allocationSpent.AllocationBar14:setAlpha( 0 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -549, -359 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc11 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( false, true, 454, -316 )
				self.TitleNumBrdr:setTopBottom( true, false, 37.5, -4.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( false, true, -310, 17 )
				self.allocationSpent:setTopBottom( true, false, 1, 33 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 0 )
				self.allocationSpent.AllocationBar12:setAlpha( 0 )
				self.allocationSpent.AllocationBar13:setAlpha( 0 )
				self.allocationSpent.AllocationBar14:setAlpha( 0 )
				self.allocationSpent.AllocationBar15:setAlpha( 0 )
				self.allocationSpent.AllocationBar16:setAlpha( 0 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -530, -340 )
				self.UnlockTokensWidget:setTopBottom( true, false, -1, 44 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAllocationBar",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "Alloc17",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 17 )
			end
		},
		{
			stateName = "Alloc16",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 16 )
			end
		},
		{
			stateName = "Alloc15",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 15 )
			end
		},
		{
			stateName = "Alloc14",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 14 )
			end
		},
		{
			stateName = "Alloc13",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 13 )
			end
		},
		{
			stateName = "Alloc12",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 12 )
			end
		},
		{
			stateName = "Alloc11",
			condition = function ( menu, element, event )
				return IsClassAllocationInState( controller, 11 )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleNumBrdr:close()
		self.allocationSpent:close()
		self.UnlockTokensWidget:close()
		self.capacityValueLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

