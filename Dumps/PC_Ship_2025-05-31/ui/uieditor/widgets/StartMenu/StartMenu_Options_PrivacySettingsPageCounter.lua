CoD.StartMenu_Options_PrivacySettingsPageCounter = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PrivacySettingsPageCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PrivacySettingsPageCounter )
	self.id = "StartMenu_Options_PrivacySettingsPageCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 18 )
	
	local CurrentItem = LUI.UIText.new()
	CurrentItem:setLeftRight( false, false, -40, -11 )
	CurrentItem:setTopBottom( false, false, -9, 9 )
	CurrentItem:setTTF( "fonts/escom.ttf" )
	CurrentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CurrentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CurrentItem:subscribeToGlobalModel( controller, "PrivacySettingManagementForm", "currentPage", function ( model )
		local currentPage = Engine.GetModelValue( model )
		if currentPage then
			CurrentItem:setText( currentPage )
		end
	end )
	self:addElement( CurrentItem )
	self.CurrentItem = CurrentItem
	
	local Dividor = LUI.UIText.new()
	Dividor:setLeftRight( false, false, -11, 11 )
	Dividor:setTopBottom( false, false, -9, 9 )
	Dividor:setText( Engine.Localize( "MP_SLASH" ) )
	Dividor:setTTF( "fonts/escom.ttf" )
	Dividor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Dividor:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Dividor )
	self.Dividor = Dividor
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( false, false, 11, 40 )
	Count:setTopBottom( false, false, -9, 9 )
	Count:setTTF( "fonts/escom.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Count:subscribeToGlobalModel( controller, "PrivacySettingManagementForm", "lastPage", function ( model )
		local lastPage = Engine.GetModelValue( model )
		if lastPage then
			Count:setText( Engine.Localize( lastPage ) )
		end
	end )
	self:addElement( Count )
	self.Count = Count
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CurrentItem:completeAnimation()
				self.CurrentItem:setAlpha( 1 )
				self.clipFinished( CurrentItem, {} )
				Dividor:completeAnimation()
				self.Dividor:setAlpha( 1 )
				self.clipFinished( Dividor, {} )
				Count:completeAnimation()
				self.Count:setAlpha( 1 )
				self.clipFinished( Count, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CurrentItem:completeAnimation()
				self.CurrentItem:setAlpha( 0 )
				self.clipFinished( CurrentItem, {} )
				Dividor:completeAnimation()
				self.Dividor:setAlpha( 0 )
				self.clipFinished( Dividor, {} )
				Count:completeAnimation()
				self.Count:setAlpha( 0 )
				self.clipFinished( Count, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "PrivacySettingManagementForm.lastPage", 2 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrivacySettingManagementForm.lastPage" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrivacySettingManagementForm.lastPage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CurrentItem:close()
		element.Count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

