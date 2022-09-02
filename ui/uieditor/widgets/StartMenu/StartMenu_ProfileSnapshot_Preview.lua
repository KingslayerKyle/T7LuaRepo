-- 0b7ae75a997668d63ec5bc3edf7f5a1f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )

CoD.StartMenu_ProfileSnapshot_Preview = InheritFrom( LUI.UIElement )
CoD.StartMenu_ProfileSnapshot_Preview.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_ProfileSnapshot_Preview )
	self.id = "StartMenu_ProfileSnapshot_Preview"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 367 )
	self:setTopBottom( true, false, 0, 326 )
	self.anyChildUsesUpdateState = true
	
	local screenshotImage = LUI.UIElement.new()
	screenshotImage:setLeftRight( true, true, 1, -2 )
	screenshotImage:setTopBottom( true, true, 1, -1.5 )
	screenshotImage:subscribeToGlobalModel( controller, "CombatRecordProfileSnapshot", "fileId", function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			screenshotImage:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_SCREENSHOT", fileId ) )
		end
	end )
	self:addElement( screenshotImage )
	self.screenshotImage = screenshotImage
	
	local ImageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	ImageContainer:setLeftRight( true, true, 0, 0 )
	ImageContainer:setTopBottom( true, true, 0, 0 )
	ImageContainer:setAlpha( 0 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				screenshotImage:completeAnimation()
				self.screenshotImage:setAlpha( 0 )
				self.clipFinished( screenshotImage, {} )

				ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 1 )
				self.clipFinished( ImageContainer, {} )
			end
		},
		Snapshot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				screenshotImage:completeAnimation()
				self.screenshotImage:setAlpha( 1 )
				self.clipFinished( screenshotImage, {} )

				ImageContainer:completeAnimation()
				self.ImageContainer:setAlpha( 0 )
				self.clipFinished( ImageContainer, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Snapshot",
			condition = function ( menu, element, event )
				return CombatRecordProfileSnapshotShouldShowSnapshot( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordProfileSnapshot.fileId" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordProfileSnapshot.fileId"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageContainer:close()
		element.screenshotImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

