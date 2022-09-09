-- b52bea6b79d0ee18978f652c39fcc5d9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_MusicTracks_Checkbox" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )

CoD.StartMenu_MusicTracks_CheckBoxOption = InheritFrom( LUI.UIElement )
CoD.StartMenu_MusicTracks_CheckBoxOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_MusicTracks_CheckBoxOption )
	self.id = "StartMenu_MusicTracks_CheckBoxOption"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 504 )
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
	self:addElement( checkbox )
	self.checkbox = checkbox
	
	local trackName = LUI.UITightText.new()
	trackName:setLeftRight( true, false, 19, 219 )
	trackName:setTopBottom( false, false, -11, 11 )
	trackName:setTTF( "fonts/default.ttf" )
	trackName:linkToElementModel( self, "trackName", true, function ( model )
		local _trackName = Engine.GetModelValue( model )
		if _trackName then
			trackName:setText( Engine.Localize( _trackName ) )
		end
	end )
	self:addElement( trackName )
	self.trackName = trackName
	
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

				trackName:completeAnimation()
				self.trackName:setRGB( 1, 1, 1 )
				self.clipFinished( trackName, {} )

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

				trackName:completeAnimation()
				self.trackName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( trackName, {} )

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

				trackName:completeAnimation()
				self.trackName:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.clipFinished( trackName, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not IsModelValueEqualToEnum( controller, "profile.snd_frontendTracksState", Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "profile.snd_frontendTracksState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profile.snd_frontendTracksState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.checkbox:close()
		element.MissionRecordVaultlines010:close()
		element.MissionRecordVaultlines0100:close()
		element.trackName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
