-- ca76faa12b2b9ac06cccf9ee6691ff45
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, 0, 1280 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 619, 667 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SizeToSafeArea( element, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo:setLeftRight( true, false, 798, 1216 )
	FileshareSelectedItemInfo:setTopBottom( true, false, 558, 642 )
	FileshareSelectedItemInfo:subscribeToGlobalModel( controller, "FileshareSelectedItem", nil, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local ItemName = CoD.InfoPaneItemName.new( menu, controller )
	ItemName:setLeftRight( true, false, 64, 445 )
	ItemName:setTopBottom( true, false, 556.5, 590.5 )
	ItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "weaponName", function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			ItemName.weaponNameWithVariant.itemName.itemName:setText( weaponName )
		end
	end )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ItemName.weaponNameWithVariant.variantName.itemName:setText( fileName )
		end
	end )
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
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local EmblemName = CoD.InfoPaneItemName.new( menu, controller )
	EmblemName:setLeftRight( true, false, 64, 445 )
	EmblemName:setTopBottom( true, false, 558, 592 )
	EmblemName:setAlpha( 0 )
	EmblemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	EmblemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	EmblemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			EmblemName.weaponNameWithVariant.itemName.itemName:setText( fileName )
		end
	end )
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
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ItemName:completeAnimation()
				self.ItemName:setAlpha( 1 )
				self.clipFinished( ItemName, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 0 )
				self.clipFinished( EmblemName, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ItemName:completeAnimation()
				self.ItemName:setAlpha( 0 )
				self.clipFinished( ItemName, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 0 )
				self.clipFinished( EmblemName, {} )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ItemName:completeAnimation()
				self.ItemName:setAlpha( 0 )
				self.clipFinished( ItemName, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 1 )
				self.clipFinished( EmblemName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterContainerNOTLobby:close()
		element.FileshareSelectedItemInfo:close()
		element.ItemName:close()
		element.EmblemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

