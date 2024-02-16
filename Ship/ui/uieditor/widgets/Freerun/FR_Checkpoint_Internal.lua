-- 539bae75c4e4e7c1d4b5d764cae0242f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_Checkpoint_Delta" )

CoD.FR_Checkpoint_Internal = InheritFrom( LUI.UIElement )
CoD.FR_Checkpoint_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_Checkpoint_Internal )
	self.id = "FR_Checkpoint_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 185 )
	self:setTopBottom( true, false, 0, 74 )
	self.anyChildUsesUpdateState = true
	
	local InfoBarBlur = LUI.UIImage.new()
	InfoBarBlur:setLeftRight( true, true, 0, 0 )
	InfoBarBlur:setTopBottom( true, false, 0, 37 )
	InfoBarBlur:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_blur" ) )
	InfoBarBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	InfoBarBlur:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( InfoBarBlur )
	self.InfoBarBlur = InfoBarBlur
	
	local Box1 = LUI.UIImage.new()
	Box1:setLeftRight( true, true, -2, 2 )
	Box1:setTopBottom( true, false, 0, 37 )
	Box1:setRGB( 0, 0, 0 )
	Box1:setAlpha( 0.5 )
	Box1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box1:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local FaultsTextBox = LUI.UIText.new()
	FaultsTextBox:setLeftRight( true, true, 0, 0 )
	FaultsTextBox:setTopBottom( true, false, 7.5, 29.5 )
	FaultsTextBox:setText( Engine.Localize( "FREERUN_CHECKPOINT" ) )
	FaultsTextBox:setTTF( "fonts/escom.ttf" )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FaultsTextBox )
	self.FaultsTextBox = FaultsTextBox
	
	local FRCheckpointDelta = CoD.FR_Checkpoint_Delta.new( menu, controller )
	FRCheckpointDelta:setLeftRight( true, false, -11, 172 )
	FRCheckpointDelta:setTopBottom( true, false, 39.88, 65 )
	FRCheckpointDelta:linkToElementModel( self, nil, false, function ( model )
		FRCheckpointDelta:setModel( model, controller )
	end )
	self:addElement( FRCheckpointDelta )
	self.FRCheckpointDelta = FRCheckpointDelta
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FRCheckpointDelta:completeAnimation()
				self.FRCheckpointDelta:setAlpha( 0 )
				self.clipFinished( FRCheckpointDelta, {} )
			end
		},
		TimeVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FRCheckpointDelta:completeAnimation()
				self.FRCheckpointDelta:setAlpha( 1 )
				self.clipFinished( FRCheckpointDelta, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "TimeVisible",
			condition = function ( menu, element, event )
				return ShouldShowFreerunTimeClips( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.runState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRCheckpointDelta:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
