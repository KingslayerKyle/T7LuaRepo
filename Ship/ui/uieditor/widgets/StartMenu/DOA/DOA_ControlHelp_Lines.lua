-- e126512fef88c7d8be80110819babd35
-- This hash is used for caching, delete to decompile the file again

CoD.DOA_ControlHelp_Lines = InheritFrom( LUI.UIElement )
CoD.DOA_ControlHelp_Lines.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DOA_ControlHelp_Lines )
	self.id = "DOA_ControlHelp_Lines"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 572 )
	self:setTopBottom( true, false, 0, 312 )
	
	local defaultLines = LUI.UIImage.new()
	defaultLines:setLeftRight( true, true, 0, 0 )
	defaultLines:setTopBottom( true, true, 0, 0 )
	defaultLines:setAlpha( 0 )
	defaultLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_orbis_doa" ) )
	self:addElement( defaultLines )
	self.defaultLines = defaultLines
	
	local redinsRallyLines = LUI.UIImage.new()
	redinsRallyLines:setLeftRight( true, true, 0, 0 )
	redinsRallyLines:setTopBottom( true, true, 0, 0 )
	redinsRallyLines:setAlpha( 0 )
	redinsRallyLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_orbis_doa_redins" ) )
	self:addElement( redinsRallyLines )
	self.redinsRallyLines = redinsRallyLines
	
	local DOAfpsLines = LUI.UIImage.new()
	DOAfpsLines:setLeftRight( true, true, 0, 0 )
	DOAfpsLines:setTopBottom( true, true, 0, 0 )
	DOAfpsLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_orbis_doa_fps" ) )
	self:addElement( DOAfpsLines )
	self.DOAfpsLines = DOAfpsLines
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				defaultLines:completeAnimation()
				self.defaultLines:setAlpha( 1 )
				self.clipFinished( defaultLines, {} )

				redinsRallyLines:completeAnimation()
				self.redinsRallyLines:setAlpha( 0 )
				self.clipFinished( redinsRallyLines, {} )

				DOAfpsLines:completeAnimation()
				self.DOAfpsLines:setAlpha( 0 )
				self.clipFinished( DOAfpsLines, {} )
			end
		},
		RedinsRally = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				defaultLines:completeAnimation()
				self.defaultLines:setAlpha( 0 )
				self.clipFinished( defaultLines, {} )

				redinsRallyLines:completeAnimation()
				self.redinsRallyLines:setLeftRight( true, true, -1, -1 )
				self.redinsRallyLines:setTopBottom( true, true, -3, -3 )
				self.redinsRallyLines:setAlpha( 1 )
				self.clipFinished( redinsRallyLines, {} )

				DOAfpsLines:completeAnimation()
				self.DOAfpsLines:setAlpha( 0 )
				self.clipFinished( DOAfpsLines, {} )
			end
		},
		DOAfps = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				defaultLines:completeAnimation()
				self.defaultLines:setAlpha( 0 )
				self.clipFinished( defaultLines, {} )

				redinsRallyLines:completeAnimation()
				self.redinsRallyLines:setAlpha( 0 )
				self.clipFinished( redinsRallyLines, {} )

				DOAfpsLines:completeAnimation()
				self.DOAfpsLines:setAlpha( 1 )
				self.clipFinished( DOAfpsLines, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "RedinsRally",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.driving", 1 )
			end
		},
		{
			stateName = "DOAfps",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.doafps", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.driving" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.driving"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.doafps" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.doafps"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
