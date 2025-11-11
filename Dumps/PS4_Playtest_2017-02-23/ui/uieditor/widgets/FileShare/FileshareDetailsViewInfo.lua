require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

CoD.FileshareDetailsViewInfo = InheritFrom( LUI.UIElement )
CoD.FileshareDetailsViewInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareDetailsViewInfo )
	self.id = "FileshareDetailsViewInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( 0, 0, 0, 1920 )
	feFooterContainerNOTLobby:setTopBottom( 0, 0, 928, 1000 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo:setLeftRight( 0, 0, 1196.5, 1823.5 )
	FileshareSelectedItemInfo:setTopBottom( 0, 0, 837, 963 )
	FileshareSelectedItemInfo:subscribeToGlobalModel( controller, "FileshareSelectedItem", nil, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local ItemName = CoD.InfoPaneItemName.new( menu, controller )
	ItemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	ItemName:setLeftRight( 0, 0, 96, 668 )
	ItemName:setTopBottom( 0, 0, 834.5, 885.5 )
	ItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "weaponName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local EmblemName = CoD.InfoPaneItemName.new( menu, controller )
	EmblemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	EmblemName:setLeftRight( 0, 0, 96, 668 )
	EmblemName:setTopBottom( 0, 0, 836.5, 887.5 )
	EmblemName:setAlpha( 0 )
	EmblemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	EmblemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	EmblemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	self.resetProperties = function ()
		EmblemName:completeAnimation()
		ItemName:completeAnimation()
		FileshareSelectedItemInfo:completeAnimation()
		feFooterContainerNOTLobby:completeAnimation()
		EmblemName:setAlpha( 0 )
		ItemName:setAlpha( 1 )
		FileshareSelectedItemInfo:setAlpha( 1 )
		feFooterContainerNOTLobby:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ItemName:completeAnimation()
				self.ItemName:setAlpha( 0 )
				self.clipFinished( ItemName, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 1 )
				self.clipFinished( EmblemName, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ItemName:completeAnimation()
				self.ItemName:setAlpha( 0 )
				self.clipFinished( ItemName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feFooterContainerNOTLobby:close()
		self.FileshareSelectedItemInfo:close()
		self.ItemName:close()
		self.EmblemName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

