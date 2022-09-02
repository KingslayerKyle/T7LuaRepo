-- dc7a9b26cb0604f367db873996002002
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_MusicTracks_Checkbox" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )

CoD.ServerBrowserCheckBox = InheritFrom( LUI.UIElement )
CoD.ServerBrowserCheckBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserCheckBox )
	self.id = "ServerBrowserCheckBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 0, 400 )
	backing:setTopBottom( true, false, 0, 25 )
	backing:setAlpha( 0 )
	self:addElement( backing )
	self.backing = backing
	
	local checkbox = CoD.StartMenu_MusicTracks_Checkbox.new( menu, controller )
	checkbox:setLeftRight( true, false, 0, 14 )
	checkbox:setTopBottom( false, false, -7, 7 )
	checkbox:linkToElementModel( self, nil, false, function ( model )
		checkbox:setModel( model, controller )
	end )
	checkbox:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return IsFilterActive( self, element )
			end
		}
	} )
	checkbox:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.filterRefresh" ), function ( model )
		menu:updateElementState( checkbox, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.filterRefresh"
		} )
	end )
	self:addElement( checkbox )
	self.checkbox = checkbox
	
	local itemName = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	itemName:setLeftRight( true, false, 19, 150 )
	itemName:setTopBottom( true, false, 2.5, 22.5 )
	itemName.textBox:setTTF( "fonts/default.ttf" )
	itemName.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.textBox:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local MissionRecordVaultlines010 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines010:setLeftRight( true, true, 396, -395 )
	MissionRecordVaultlines010:setTopBottom( false, true, -26.5, -22.44 )
	MissionRecordVaultlines010:setAlpha( 0 )
	self:addElement( MissionRecordVaultlines010 )
	self.MissionRecordVaultlines010 = MissionRecordVaultlines010
	
	local MissionRecordVaultlines0100 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines0100:setLeftRight( true, true, 396, -395 )
	MissionRecordVaultlines0100:setTopBottom( false, true, -2.5, 1.56 )
	MissionRecordVaultlines0100:setAlpha( 0 )
	self:addElement( MissionRecordVaultlines0100 )
	self.MissionRecordVaultlines0100 = MissionRecordVaultlines0100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				backing:completeAnimation()
				self.backing:setLeftRight( true, false, 0, 400 )
				self.backing:setTopBottom( true, false, 0, 25 )
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )

				checkbox:completeAnimation()
				self.checkbox:setRGB( 1, 1, 1 )
				self.clipFinished( checkbox, {} )

				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )

				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultlines010, {} )

				MissionRecordVaultlines0100:completeAnimation()
				self.MissionRecordVaultlines0100:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultlines0100, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )

				checkbox:completeAnimation()
				self.checkbox:setRGB( 1, 1, 1 )
				self.clipFinished( checkbox, {} )

				itemName:completeAnimation()
				self.itemName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( itemName, {} )

				MissionRecordVaultlines010:completeAnimation()
				self.MissionRecordVaultlines010:setLeftRight( true, true, 499, -500 )
				self.MissionRecordVaultlines010:setTopBottom( false, true, -30.5, -19.44 )
				self.MissionRecordVaultlines010:setAlpha( 1 )
				self.clipFinished( MissionRecordVaultlines010, {} )

				MissionRecordVaultlines0100:completeAnimation()
				self.MissionRecordVaultlines0100:setLeftRight( true, true, 499, -500 )
				self.MissionRecordVaultlines0100:setTopBottom( false, true, -2.5, 1.56 )
				self.MissionRecordVaultlines0100:setAlpha( 1 )
				self.clipFinished( MissionRecordVaultlines0100, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				checkbox:completeAnimation()
				self.checkbox:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.clipFinished( checkbox, {} )

				itemName:completeAnimation()
				self.itemName:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.clipFinished( itemName, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.checkbox:close()
		element.itemName:close()
		element.MissionRecordVaultlines010:close()
		element.MissionRecordVaultlines0100:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

