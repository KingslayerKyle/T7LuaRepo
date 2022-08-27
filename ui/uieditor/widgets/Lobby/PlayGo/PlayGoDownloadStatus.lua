-- 5b75ab6991f8233c3e5d499215f09e2d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 20 )
	
	local ChunkName = LUI.UITightText.new()
	ChunkName:setLeftRight( true, false, 4.5, 169.5 )
	ChunkName:setTopBottom( true, false, 1, 21 )
	ChunkName:setTTF( "fonts/default.ttf" )
	ChunkName:subscribeToGlobalModel( controller, "PlayGoDownloadProgress", "chunk", function ( model )
		local chunk = Engine.GetModelValue( model )
		if chunk then
			ChunkName:setText( Engine.Localize( chunk ) )
		end
	end )
	self:addElement( ChunkName )
	self.ChunkName = ChunkName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChunkName:completeAnimation()
				self.ChunkName:setAlpha( 0 )
				self.clipFinished( ChunkName, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChunkName:completeAnimation()
				self.ChunkName:setAlpha( 1 )
				self.clipFinished( ChunkName, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChunkName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

