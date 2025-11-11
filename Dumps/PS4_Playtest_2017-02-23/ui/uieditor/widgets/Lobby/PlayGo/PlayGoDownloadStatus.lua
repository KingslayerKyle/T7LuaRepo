CoD.PlayGoDownloadStatus = InheritFrom( LUI.UIElement )
CoD.PlayGoDownloadStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayGoDownloadStatus )
	self.id = "PlayGoDownloadStatus"
	self.soundSet = "Special_widgets"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local ChunkName = LUI.UITightText.new()
	ChunkName:setLeftRight( 0, 0, 6, 254 )
	ChunkName:setTopBottom( 0, 0, 1, 31 )
	ChunkName:setTTF( "fonts/default.ttf" )
	ChunkName:subscribeToGlobalModel( controller, "PlayGoDownloadProgress", "chunk", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChunkName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ChunkName )
	self.ChunkName = ChunkName
	
	self.resetProperties = function ()
		ChunkName:completeAnimation()
		ChunkName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ChunkName:completeAnimation()
				self.ChunkName:setAlpha( 0 )
				self.clipFinished( ChunkName, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return PlayGoIsStillDownloading( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChunkName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

