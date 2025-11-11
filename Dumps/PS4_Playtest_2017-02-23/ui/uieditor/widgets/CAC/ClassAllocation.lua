require( "ui.uieditor.widgets.CAC.AllocationSpentWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

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
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 52 )
	self.anyChildUsesUpdateState = true
	
	local TitleNumBrdr = CoD.FE_TitleNumBrdr.new( menu, controller )
	TitleNumBrdr:setLeftRight( 1, 1, 0, -446 )
	TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
	TitleNumBrdr:setAlpha( 0.2 )
	self:addElement( TitleNumBrdr )
	self.TitleNumBrdr = TitleNumBrdr
	
	local allocationSpent = CoD.AllocationSpentWidget.new( menu, controller )
	allocationSpent:setLeftRight( 1, 1, -436, 54 )
	allocationSpent:setTopBottom( 0, 0, 2, 50 )
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
	TextBoxSlash:setLeftRight( 1, 1, -108, -69 )
	TextBoxSlash:setTopBottom( 0, 0, 2, 50 )
	TextBoxSlash:setRGB( 0.58, 0.64, 0.65 )
	TextBoxSlash:setAlpha( 0.5 )
	TextBoxSlash:setText( Engine.Localize( "/" ) )
	TextBoxSlash:setTTF( "fonts/escom.ttf" )
	TextBoxSlash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBoxSlash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxSlash )
	self.TextBoxSlash = TextBoxSlash
	
	local totalCapacityLabel = LUI.UIText.new()
	totalCapacityLabel:setLeftRight( 1, 1, -67, -9 )
	totalCapacityLabel:setTopBottom( 0, 0, 4, 52 )
	totalCapacityLabel:setRGB( 0.84, 0.86, 0.87 )
	totalCapacityLabel:setText( Engine.Localize( GetMaxAllocationAmount( controller, "10" ) ) )
	totalCapacityLabel:setTTF( "fonts/escom.ttf" )
	totalCapacityLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalCapacityLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( totalCapacityLabel )
	self.totalCapacityLabel = totalCapacityLabel
	
	local capacityValueLabel = LUI.UIText.new()
	capacityValueLabel:setLeftRight( 1, 1, -164, -92 )
	capacityValueLabel:setTopBottom( 0, 0, 4, 52 )
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
	UnlockTokensWidget:setLeftRight( 1, 1, -814, -456 )
	UnlockTokensWidget:setTopBottom( 0, 0, -1, 65 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	self.resetProperties = function ()
		UnlockTokensWidget:completeAnimation()
		capacityValueLabel:completeAnimation()
		totalCapacityLabel:completeAnimation()
		TextBoxSlash:completeAnimation()
		allocationSpent:completeAnimation()
		TitleNumBrdr:completeAnimation()
		UnlockTokensWidget:setLeftRight( 1, 1, -814, -456 )
		UnlockTokensWidget:setTopBottom( 0, 0, -1, 65 )
		capacityValueLabel:setAlpha( 1 )
		totalCapacityLabel:setAlpha( 1 )
		TextBoxSlash:setAlpha( 0.5 )
		allocationSpent:setLeftRight( 1, 1, -436, 54 )
		allocationSpent:setTopBottom( 0, 0, 2, 50 )
		allocationSpent:setAlpha( 1 )
		allocationSpent.AllocationBar10:setAlpha( 0 )
		allocationSpent.AllocationBar11:setAlpha( 0 )
		allocationSpent.AllocationBar12:setAlpha( 0 )
		allocationSpent.AllocationBar13:setAlpha( 0 )
		allocationSpent.AllocationBar14:setAlpha( 0 )
		allocationSpent.AllocationBar15:setAlpha( 0 )
		allocationSpent.AllocationBar16:setAlpha( 0 )
		TitleNumBrdr:setLeftRight( 1, 1, 0, -446 )
		TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
		TitleNumBrdr:setAlpha( 0.2 )
	end
	
	self.clipsPerState = {
		NoAllocationBar = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.UnlockTokensWidget:setLeftRight( 1, 1, -358, 0 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -1, 65 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 709.5, -445.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
			end
		},
		Alloc17 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 509.5, -645.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				allocationSpent.AllocationBar16:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -636, -146 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.allocationSpent.AllocationBar15:setAlpha( 1 )
				self.allocationSpent.AllocationBar16:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -966.5, -681.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc16 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 538.5, -616.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				allocationSpent.AllocationBar15:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -607, -117 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.allocationSpent.AllocationBar15:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -937.5, -652.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc15 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 567.5, -587.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				allocationSpent.AllocationBar14:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -579, -89 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.allocationSpent.AllocationBar14:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -908.5, -623.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc14 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 595.5, -559.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				allocationSpent.AllocationBar13:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -550, -60 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.allocationSpent.AllocationBar13:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -880.5, -595.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc13 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 623.5, -531.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				allocationSpent.AllocationBar12:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -522, -32 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.allocationSpent.AllocationBar12:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -852.5, -567.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc12 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 652.5, -502.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				allocationSpent.AllocationBar11:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -493, -3 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.allocationSpent.AllocationBar11:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -823.5, -538.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
				self.clipFinished( UnlockTokensWidget, {} )
			end
		},
		Alloc11 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				TitleNumBrdr:completeAnimation()
				self.TitleNumBrdr:setLeftRight( 1, 1, 681.5, -473.5 )
				self.TitleNumBrdr:setTopBottom( 0, 0, 56.5, -6.5 )
				self.clipFinished( TitleNumBrdr, {} )
				allocationSpent:completeAnimation()
				allocationSpent.AllocationBar10:completeAnimation()
				self.allocationSpent:setLeftRight( 1, 1, -465, 25 )
				self.allocationSpent:setTopBottom( 0, 0, 2, 50 )
				self.allocationSpent.AllocationBar10:setAlpha( 1 )
				self.clipFinished( allocationSpent, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -794.5, -509.5 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, -2, 66 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
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

