/*
 * Copyright 2011-2020 Branimir Karadzic. All rights reserved.
 * License: https://github.com/bkaradzic/bgfx/blob/master/LICENSE
 *
 * Modified by James Orson for Beef Lang
 */

using System;

namespace Bgfx
{
	public static
	{
	    /// <summary>
	    /// Init attachment.
	    /// </summary>
	    ///
	    /// <param name="_handle">Render target texture handle.</param>
	    /// <param name="_access">Access. See `Access::Enum`.</param>
	    /// <param name="_layer">Cubemap side or depth layer/slice.</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_resolve">Resolve flags. See: `BGFX_RESOLVE_*`</param>
	    ///
		[LinkName("bgfx_attachment_init")]
	    public static extern void AttachmentInit(Attachment* _attachment, TextureHandle _handle, Access _access, uint16 _layer, uint16 _mip, byte _resolve);
	    
	    /// <summary>
	    /// Start VertexLayout.
	    /// </summary>
	    ///
		[LinkName("bgfx_vertex_layout_begin")]
	    public static extern VertexLayout* VertexLayoutBegin(VertexLayout* _vertexLayout, RendererType _rendererType);
	    
	    /// <summary>
	    /// Add attribute to VertexLayout.
	    /// @remarks Must be called between begin/end.
	    /// </summary>
	    ///
	    /// <param name="_attrib">Attribute semantics. See: `bgfx::Attrib`</param>
	    /// <param name="_num">Number of elements 1, 2, 3 or 4.</param>
	    /// <param name="_type">Element type.</param>
	    /// <param name="_normalized">When using fixed point AttribType (f.e. Uint8) value will be normalized for vertex shader usage. When normalized is set to true, AttribType::Uint8 value in range 0-255 will be in range 0.0-1.0 in vertex shader.</param>
	    /// <param name="_asInt">Packaging rule for vertexPack, vertexUnpack, and vertexConvert for AttribType::Uint8 and AttribType::Int16. Unpacking code must be implemented inside vertex shader.</param>
	    ///
	
	    [LinkName("bgfx_vertex_layout_add")]
	    public static extern VertexLayout* VertexLayoutAdd(VertexLayout* _vertexLayout, Attrib _attrib, byte _num, AttribType _type, bool _normalized, bool _asInt);
	    
	    /// <summary>
	    /// Decode attribute.
	    /// </summary>
	    ///
	    /// <param name="_attrib">Attribute semantics. See: `bgfx::Attrib`</param>
	    /// <param name="_num">Number of elements.</param>
	    /// <param name="_type">Element type.</param>
	    /// <param name="_normalized">Attribute is normalized.</param>
	    /// <param name="_asInt">Attribute is packed as int.</param>
	    ///
	    [LinkName("bgfx_vertex_layout_decode")]
	    public static extern void VertexLayoutDecode(VertexLayout* _vertexLayout, Attrib _attrib, byte * _num, AttribType* _type, bool* _normalized, bool* _asInt);
	    
	    /// <summary>
	    /// Returns true if VertexLayout contains attribute.
	    /// </summary>
	    ///
	    /// <param name="_attrib">Attribute semantics. See: `bgfx::Attrib`</param>
	    ///
	    [LinkName("bgfx_vertex_layout_has")]
	    public static extern bool VertexLayoutHas(VertexLayout* _vertexLayout, Attrib _attrib);
	    
	    /// <summary>
	    /// Skip `_num` bytes in vertex stream.
	    /// </summary>
	    ///
	    [LinkName("bgfx_vertex_layout_skip")]
	    public static extern VertexLayout* VertexLayoutSkip(VertexLayout* _vertexLayout, byte _num);
	    
	    /// <summary>
	    /// End VertexLayout.
	    /// </summary>
	    ///
	    [LinkName("bgfx_vertex_layout_end")]
	    public static extern void VertexLayoutEnd(VertexLayout* _vertexLayout);
	    
	    /// <summary>
	    /// Pack vertex attribute into vertex stream format.
	    /// </summary>
	    ///
	    /// <param name="_input">Value to be packed into vertex stream.</param>
	    /// <param name="_inputNormalized">`true` if input value is already normalized.</param>
	    /// <param name="_attr">Attribute to pack.</param>
	    /// <param name="_layout">Vertex stream layout.</param>
	    /// <param name="_data">Destination vertex stream where data will be packed.</param>
	    /// <param name="_index">Vertex index that will be modified.</param>
	    ///
	    [LinkName("bgfx_vertex_pack")]
	    public static extern void VertexPack(float _input, bool _inputNormalized, Attrib _attr, VertexLayout* _layout, void* _data, uint32 _index);
	    
	    /// <summary>
	    /// Unpack vertex attribute from vertex stream format.
	    /// </summary>
	    ///
	    /// <param name="_output">Result of unpacking.</param>
	    /// <param name="_attr">Attribute to unpack.</param>
	    /// <param name="_layout">Vertex stream layout.</param>
	    /// <param name="_data">Source vertex stream from where data will be unpacked.</param>
	    /// <param name="_index">Vertex index that will be unpacked.</param>
	    ///
	    [LinkName("bgfx_vertex_unpack")]
	    public static extern void VertexUnpack(float _output, Attrib _attr, VertexLayout* _layout, void* _data, uint32 _index);
	    
	    /// <summary>
	    /// Converts vertex stream data from one vertex stream format to another.
	    /// </summary>
	    ///
	    /// <param name="_dstLayout">Destination vertex stream layout.</param>
	    /// <param name="_dstData">Destination vertex stream.</param>
	    /// <param name="_srcLayout">Source vertex stream layout.</param>
	    /// <param name="_srcData">Source vertex stream data.</param>
	    /// <param name="_num">Number of vertices to convert from source to destination.</param>
	    ///
	    [LinkName("bgfx_vertex_convert")]
	    public static extern void VertexConvert(VertexLayout* _dstLayout, void* _dstData, VertexLayout* _srcLayout, void* _srcData, uint32 _num);
	    
	    /// <summary>
	    /// Weld vertices.
	    /// </summary>
	    ///
	    /// <param name="_output">Welded vertices remapping table. The size of buffer must be the same as number of vertices.</param>
	    /// <param name="_layout">Vertex stream layout.</param>
	    /// <param name="_data">Vertex stream.</param>
	    /// <param name="_num">Number of vertices in vertex stream.</param>
	    /// <param name="_index32">Set to `true` if input indices are 32-bit.</param>
	    /// <param name="_epsilon">Error tolerance for vertex position comparison.</param>
	    ///
	    [LinkName("bgfx_weld_vertices")]
	    public static extern uint32 WeldVertices(void* _output, VertexLayout* _layout, void* _data, uint32 _num, bool _index32, float _epsilon);
	    
	    /// <summary>
	    /// Convert index buffer for use with different primitive topologies.
	    /// </summary>
	    ///
	    /// <param name="_conversion">Conversion type, see `TopologyConversion::Enum`.</param>
	    /// <param name="_dst">Destination index buffer. If this argument is NULL function will return number of indices after conversion.</param>
	    /// <param name="_dstSize">Destination index buffer in bytes. It must be large enough to contain output indices. If destination size is insufficient index buffer will be truncated.</param>
	    /// <param name="_indices">Source indices.</param>
	    /// <param name="_numIndices">Number of input indices.</param>
	    /// <param name="_index32">Set to `true` if input indices are 32-bit.</param>
	    ///
	    [LinkName("bgfx_topology_convert")]
	    public static extern uint32 TopologyConvert(TopologyConversion _conversion, void* _dst, uint32 _dstSize, void* _indices, uint32 _numIndices, bool _index32);
	    
	    /// <summary>
	    /// Sort indices.
	    /// </summary>
	    ///
	    /// <param name="_sort">Sort order, see `TopologySort::Enum`.</param>
	    /// <param name="_dst">Destination index buffer.</param>
	    /// <param name="_dstSize">Destination index buffer in bytes. It must be large enough to contain output indices. If destination size is insufficient index buffer will be truncated.</param>
	    /// <param name="_dir">Direction (vector must be normalized).</param>
	    /// <param name="_pos">Position.</param>
	    /// <param name="_vertices">Pointer to first vertex represented as float x, y, z. Must contain at least number of vertices referencende by index buffer.</param>
	    /// <param name="_stride">Vertex stride.</param>
	    /// <param name="_indices">Source indices.</param>
	    /// <param name="_numIndices">Number of input indices.</param>
	    /// <param name="_index32">Set to `true` if input indices are 32-bit.</param>
	    ///
	    [LinkName("bgfx_topology_sort_tri_list")]
	    public static extern void TopologySortTriangleList(TopologySort _sort, void* _dst, uint32 _dstSize, float _dir, float _pos, void* _vertices, uint32 _stride, void* _indices, uint32 _numIndices, bool _index32);
	    
	    /// <summary>
	    /// Returns supported backend API renderers.
	    /// </summary>
	    ///
	    /// <param name="_max">Maximum number of elements in _enum array.</param>
	    /// <param name="_enum">Array where supported renderers will be written.</param>
	    ///
	    [LinkName("bgfx_get_supported_renderers")]
	    public static extern byte GetSupportedRenderers(byte _max, RendererType* _enum);
	    
	    /// <summary>
	    /// Returns name of renderer.
	    /// </summary>
	    ///
	    /// <param name="_type">Renderer backend type. See: `bgfx::RendererType`</param>
	    ///
	    [LinkName("bgfx_get_renderer_name")]
	    public static extern char8* GetRendererName(RendererType _type);
	    
	    [LinkName("bgfx_init_ctor")]
	    public static extern void InitCtor(InitInfo* _init);
	    
	    /// <summary>
	    /// Initialize bgfx library.
	    /// </summary>
	    ///
	    /// <param name="_init">Initialization parameters. See: `bgfx::InitInfo` for more info.</param>
	    ///
	    [LinkName("bgfx_init")]
	    public static extern bool Init(InitInfo* _init);
	    
	    /// <summary>
	    /// Shutdown bgfx library.
	    /// </summary>
	    ///
	    [LinkName("bgfx_shutdown")]
	    public static extern void Shutdown();
	    
	    /// <summary>
	    /// Reset graphic settings and back-buffer size.
	    /// @attention This call doesn't actually change window size, it just
	    ///   resizes back-buffer. Windowing code has to change window size.
	    /// </summary>
	    ///
	    /// <param name="_width">Back-buffer width.</param>
	    /// <param name="_height">Back-buffer height.</param>
	    /// <param name="_flags">See: `BGFX_RESET_*` for more info.   - `BGFX_RESET_NONE` - No reset flags.   - `BGFX_RESET_FULLSCREEN` - Not supported yet.   - `BGFX_RESET_MSAA_X[2/4/8/16]` - Enable 2, 4, 8 or 16 x MSAA.   - `BGFX_RESET_VSYNC` - Enable V-Sync.   - `BGFX_RESET_MAXANISOTROPY` - Turn on/off max anisotropy.   - `BGFX_RESET_CAPTURE` - Begin screen capture.   - `BGFX_RESET_FLUSH_AFTER_RENDER` - Flush rendering after submitting to GPU.   - `BGFX_RESET_FLIP_AFTER_RENDER` - This flag  specifies where flip     occurs. Default behaviour is that flip occurs before rendering new     frame. This flag only has effect when `BGFX_CONFIG_MULTITHREADED=0`.   - `BGFX_RESET_SRGB_BACKBUFFER` - Enable sRGB backbuffer.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    ///
	    [LinkName("bgfx_reset")]
	    public static extern void Reset(uint32 _width, uint32 _height, ResetFlags _flags, TextureFormat _format);
	    
	    /// <summary>
	    /// Advance to next frame. When using multithreaded renderer, this call
	    /// just swaps internal buffers, kicks render thread, and returns. In
	    /// singlethreaded renderer this call does frame rendering.
	    /// </summary>
	    ///
	    /// <param name="_capture">Capture frame with graphics debugger.</param>
	    ///
	    [LinkName("bgfx_frame")]
	    public static extern uint32 Frame(bool _capture = false);
	    
	    /// <summary>
	    /// Returns current renderer backend API type.
	    /// @remarks
	    ///   Library must be initialized.
	    /// </summary>
	    ///
	    [LinkName("bgfx_get_renderer_type")]
	    public static extern RendererType GetRendererType();
	    
	    /// <summary>
	    /// Returns renderer capabilities.
	    /// @remarks
	    ///   Library must be initialized.
	    /// </summary>
	    ///
	    [LinkName("bgfx_get_caps")]
	    public static extern Caps* GetCapabilities();
	    
	    /// <summary>
	    /// Returns performance counters.
	    /// @attention Pointer returned is valid until `bgfx::frame` is called.
	    /// </summary>
	    ///
	    [LinkName("bgfx_get_stats")]
	    public static extern Stats* GetStats();
	    
	    /// <summary>
	    /// Allocate buffer to pass to bgfx calls. Data will be freed inside bgfx.
	    /// </summary>
	    ///
	    /// <param name="_size">Size to allocate.</param>
	    ///
	    [LinkName("bgfx_alloc")]
	    public static extern Memory* Alloc(uint32 _size);
	    
	    /// <summary>
	    /// Allocate buffer and copy data into it. Data will be freed inside bgfx.
	    /// </summary>
	    ///
	    /// <param name="_data">Pointer to data to be copied.</param>
	    /// <param name="_size">Size of data to be copied.</param>
	    ///
	    [LinkName("bgfx_copy")]
	    public static extern Memory* Copy(void* _data, uint32 _size);
	    
	    /// <summary>
	    /// Make reference to data to pass to bgfx. Unlike `bgfx::alloc`, this call
	    /// doesn't allocate memory for data. It just copies the _data pointer. You
	    /// can pass `ReleaseFn` function pointer to release this memory after it's
	    /// consumed, otherwise you must make sure _data is available for at least 2
	    /// `bgfx::frame` calls. `ReleaseFn` function must be able to be called
	    /// from any thread.
	    /// @attention Data passed must be available for at least 2 `bgfx::frame` calls.
	    /// </summary>
	    ///
	    /// <param name="_data">Pointer to data.</param>
	    /// <param name="_size">Size of data.</param>
	    ///
	    [LinkName("bgfx_make_ref")]
	    public static extern Memory* MakeRef(void* _data, uint32 _size);
	    
	    /// <summary>
	    /// Make reference to data to pass to bgfx. Unlike `bgfx::alloc`, this call
	    /// doesn't allocate memory for data. It just copies the _data pointer. You
	    /// can pass `ReleaseFn` function pointer to release this memory after it's
	    /// consumed, otherwise you must make sure _data is available for at least 2
	    /// `bgfx::frame` calls. `ReleaseFn` function must be able to be called
	    /// from any thread.
	    /// @attention Data passed must be available for at least 2 `bgfx::frame` calls.
	    /// </summary>
	    ///
	    /// <param name="_data">Pointer to data.</param>
	    /// <param name="_size">Size of data.</param>
	    /// <param name="_releaseFn">Callback function to release memory after use.</param>
	    /// <param name="_userData">User data to be passed to callback function.</param>
	    ///
	    [LinkName("bgfx_make_ref_release")]
	    public static extern Memory* MakeRefRelease(void* _data, uint32 _size, void* _releaseFn, void* _userData);
	    
	    /// <summary>
	    /// Set debug flags.
	    /// </summary>
	    ///
	    /// <param name="_debug">Available flags:   - `BGFX_DEBUG_IFH` - Infinitely fast hardware. When this flag is set     all rendering calls will be skipped. This is useful when profiling     to quickly assess potential bottlenecks between CPU and GPU.   - `BGFX_DEBUG_PROFILER` - Enable profiler.   - `BGFX_DEBUG_STATS` - Display internal statistics.   - `BGFX_DEBUG_TEXT` - Display debug text.   - `BGFX_DEBUG_WIREFRAME` - Wireframe rendering. All rendering     primitives will be rendered as lines.</param>
	    ///
	    [LinkName("bgfx_set_debug")]
	    public static extern void SetDebug(DebugFlags _debug);
	    
	    /// <summary>
	    /// Clear internal debug text buffer.
	    /// </summary>
	    ///
	    /// <param name="_attr">Background color.</param>
	    /// <param name="_small">Default 8x16 or 8x8 font.</param>
	    ///
	    [LinkName("bgfx_dbg_text_clear")]
	    public static extern void DebugTextClear(byte _attr, bool _small);
	    
	    /// <summary>
	    /// Print formatted data to internal debug text character-buffer (VGA-compatible text mode).
	    /// </summary>
	    ///
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_attr">Color palette. Where top 4-bits represent index of background, and bottom 4-bits represent foreground color from standard VGA text palette (ANSI escape codes).</param>
	    /// <param name="_format">`printf` style format.</param>
	    ///
	    [LinkName("bgfx_dbg_text_printf")]
	    public static extern void DebugTextPrintf(uint16 _x, uint16 _y, byte _attr, char8* _format, char8* args );
	    
	    /// <summary>
	    /// Print formatted data from variable argument list to internal debug text character-buffer (VGA-compatible text mode).
	    /// </summary>
	    ///
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_attr">Color palette. Where top 4-bits represent index of background, and bottom 4-bits represent foreground color from standard VGA text palette (ANSI escape codes).</param>
	    /// <param name="_format">`printf` style format.</param>
	    /// <param name="_argList">Variable arguments list for format string.</param>
	    ///
	    [LinkName("bgfx_dbg_text_vprintf")]
	    public static extern void DebugTextVprintf(uint16 _x, uint16 _y, byte _attr, char8* _format, void* _argList);
	
	    /// <summary>
	    /// Draw image into internal debug text buffer.
	    /// </summary>
	    ///
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_width">Image width.</param>
	    /// <param name="_height">Image height.</param>
	    /// <param name="_data">Raw image data (character/attribute raw encoding).</param>
	    /// <param name="_pitch">Image pitch in bytes.</param>
	    ///
	    [LinkName("bgfx_dbg_text_image")]
	    public static extern void DebugTextImage(uint16 _x, uint16 _y, uint16 _width, uint16 _height, void* _data, uint16 _pitch);
	    
	    /// <summary>
	    /// Create static index buffer.
	    /// </summary>
	    ///
	    /// <param name="_mem">Index buffer data.</param>
	    /// <param name="_flags">Buffer creation flags.   - `BGFX_BUFFER_NONE` - No flags.   - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.   - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer       is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.   - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.   - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of       data is passed. If this flag is not specified, and more data is passed on update, the buffer       will be trimmed to fit the existing buffer size. This flag has effect only on dynamic       buffers.   - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on       index buffers.</param>
	    ///
	    [LinkName("bgfx_create_index_buffer")]
	    public static extern IndexBufferHandle CreateIndexBuffer(Memory* _memory, BufferFlags _flags);
	    
	    /// <summary>
	    /// Set static index buffer debug name.
	    /// </summary>
	    ///
	    /// <param name="_handle">Static index buffer handle.</param>
	    /// <param name="_name">Static index buffer name.</param>
	    /// <param name="_len">Static index buffer name length (if length is INT32_MAX, it's expected that _name is zero terminated string.</param>
	    ///
	    [LinkName("bgfx_set_index_buffer_name")]
	    public static extern void SetIndexBufferName(IndexBufferHandle _handle, char8* _name, int32 _len);
	    
	    /// <summary>
	    /// Destroy static index buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Static index buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_index_buffer")]
	    public static extern void DestroyIndexBuffer(IndexBufferHandle _handle);
	    
	    /// <summary>
	    /// Create vertex layout.
	    /// </summary>
	    ///
	    /// <param name="_layout">Vertex layout.</param>
	    ///
	    [LinkName("bgfx_create_vertex_layout")]
	    public static extern VertexLayoutHandle CreateVertexLayout(VertexLayout* _layout);
	    
	    /// <summary>
	    /// Destroy vertex layout.
	    /// </summary>
	    ///
	    /// <param name="_layoutHandle">Vertex layout handle.</param>
	    ///
	    [LinkName("bgfx_destroy_vertex_layout")]
	    public static extern void DestroyVertexLayout(VertexLayoutHandle _layoutHandle);
	    
	    /// <summary>
	    /// Create static vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_mem">Vertex buffer data.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    /// <param name="_flags">Buffer creation flags.  - `BGFX_BUFFER_NONE` - No flags.  - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.  - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer      is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.  - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.  - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of      data is passed. If this flag is not specified, and more data is passed on update, the buffer      will be trimmed to fit the existing buffer size. This flag has effect only on dynamic buffers.  - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on index buffers.</param>
	    ///
	    [LinkName("bgfx_create_vertex_buffer")]
	    public static extern VertexBufferHandle CreateVertexBuffer(Memory* _memory, VertexLayout* _layout, BufferFlags _flags);
	    
	    /// <summary>
	    /// Set static vertex buffer debug name.
	    /// </summary>
	    ///
	    /// <param name="_handle">Static vertex buffer handle.</param>
	    /// <param name="_name">Static vertex buffer name.</param>
	    /// <param name="_len">Static vertex buffer name length (if length is INT32_MAX, it's expected that _name is zero terminated string.</param>
	    ///
	    [LinkName("bgfx_set_vertex_buffer_name")]
	    public static extern void SetVertexBufferName(VertexBufferHandle _handle, char8* _name, int32 _len);
	    
	    /// <summary>
	    /// Destroy static vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Static vertex buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_vertex_buffer")]
	    public static extern void DestroyVertexBuffer(VertexBufferHandle _handle);
	    
	    /// <summary>
	    /// Create empty dynamic index buffer.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of indices.</param>
	    /// <param name="_flags">Buffer creation flags.   - `BGFX_BUFFER_NONE` - No flags.   - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.   - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer       is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.   - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.   - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of       data is passed. If this flag is not specified, and more data is passed on update, the buffer       will be trimmed to fit the existing buffer size. This flag has effect only on dynamic       buffers.   - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on       index buffers.</param>
	    ///
	    [LinkName("bgfx_create_dynamic_index_buffer")]
	    public static extern DynamicIndexBufferHandle CreateDynamicIndexBuffer(uint32 _num, BufferFlags _flags);
	    
	    /// <summary>
	    /// Create dynamic index buffer and initialized it.
	    /// </summary>
	    ///
	    /// <param name="_mem">Index buffer data.</param>
	    /// <param name="_flags">Buffer creation flags.   - `BGFX_BUFFER_NONE` - No flags.   - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.   - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer       is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.   - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.   - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of       data is passed. If this flag is not specified, and more data is passed on update, the buffer       will be trimmed to fit the existing buffer size. This flag has effect only on dynamic       buffers.   - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on       index buffers.</param>
	    ///
	    [LinkName("bgfx_create_dynamic_index_buffer_mem")]
	    public static extern DynamicIndexBufferHandle CreateDynamicIndexBufferMemory(Memory* _memory, BufferFlags _flags);
	    
	    /// <summary>
	    /// Update dynamic index buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic index buffer handle.</param>
	    /// <param name="_startIndex">Start index.</param>
	    /// <param name="_mem">Index buffer data.</param>
	    ///
	    [LinkName("bgfx_update_dynamic_index_buffer")]
	    public static extern void UpdateDynamicIndexBuffer(DynamicIndexBufferHandle _handle, uint32 _startIndex, Memory* _memory);
	    
	    /// <summary>
	    /// Destroy dynamic index buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic index buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_dynamic_index_buffer")]
	    public static extern void DestroyDynamicIndexBuffer(DynamicIndexBufferHandle _handle);
	    
	    /// <summary>
	    /// Create empty dynamic vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of vertices.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    /// <param name="_flags">Buffer creation flags.   - `BGFX_BUFFER_NONE` - No flags.   - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.   - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer       is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.   - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.   - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of       data is passed. If this flag is not specified, and more data is passed on update, the buffer       will be trimmed to fit the existing buffer size. This flag has effect only on dynamic       buffers.   - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on       index buffers.</param>
	    ///
	    [LinkName("bgfx_create_dynamic_vertex_buffer")]
	    public static extern DynamicVertexBufferHandle CreateDynamicVertexBuffer(uint32 _num, VertexLayout* _layout, BufferFlags _flags);
	    
	    /// <summary>
	    /// Create dynamic vertex buffer and initialize it.
	    /// </summary>
	    ///
	    /// <param name="_mem">Vertex buffer data.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    /// <param name="_flags">Buffer creation flags.   - `BGFX_BUFFER_NONE` - No flags.   - `BGFX_BUFFER_COMPUTE_READ` - Buffer will be read from by compute shader.   - `BGFX_BUFFER_COMPUTE_WRITE` - Buffer will be written into by compute shader. When buffer       is created with `BGFX_BUFFER_COMPUTE_WRITE` flag it cannot be updated from CPU.   - `BGFX_BUFFER_COMPUTE_READ_WRITE` - Buffer will be used for read/write by compute shader.   - `BGFX_BUFFER_ALLOW_RESIZE` - Buffer will resize on buffer update if a different amount of       data is passed. If this flag is not specified, and more data is passed on update, the buffer       will be trimmed to fit the existing buffer size. This flag has effect only on dynamic       buffers.   - `BGFX_BUFFER_INDEX32` - Buffer is using 32-bit indices. This flag has effect only on       index buffers.</param>
	    ///
	    [LinkName("bgfx_create_dynamic_vertex_buffer_mem")]
	    public static extern DynamicVertexBufferHandle CreateDynamicVertexBufferMemory(Memory* _memory, VertexLayout* _layout, BufferFlags _flags);
	    
	    /// <summary>
	    /// Update dynamic vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic vertex buffer handle.</param>
	    /// <param name="_startVertex">Start vertex.</param>
	    /// <param name="_mem">Vertex buffer data.</param>
	    ///
	    [LinkName("bgfx_update_dynamic_vertex_buffer")]
	    public static extern void UpdateDynamicVertexBuffer(DynamicVertexBufferHandle _handle, uint32 _startVertex, Memory* _memory);
	    
	    /// <summary>
	    /// Destroy dynamic vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic vertex buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_dynamic_vertex_buffer")]
	    public static extern void DestroyDynamicVertexBuffer(DynamicVertexBufferHandle _handle);
	    
	    /// <summary>
	    /// Returns number of requested or maximum available indices.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of required indices.</param>
	    ///
	    [LinkName("bgfx_get_avail_transient_index_buffer")]
	    public static extern uint32 GetAvailableTransientIndexBuffer(uint32 _num);
	    
	    /// <summary>
	    /// Returns number of requested or maximum available vertices.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of required vertices.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    ///
	    [LinkName("bgfx_get_avail_transient_vertex_buffer")]
	    public static extern uint32 GetAvailableTransientVertexBuffer(uint32 _num, VertexLayout* _layout);
	    
	    /// <summary>
	    /// Returns number of requested or maximum available instance buffer slots.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of required instances.</param>
	    /// <param name="_stride">Stride per instance.</param>
	    ///
	    [LinkName("bgfx_get_avail_instance_data_buffer")]
	    public static extern uint32 GetAvailableInstanceDataBuffer(uint32 _num, uint16 _stride);
	    
	    /// <summary>
	    /// Allocate transient index buffer.
	    /// @remarks
	    ///   Only 16-bit index buffer is supported.
	    /// </summary>
	    ///
	    /// <param name="_tib">TransientIndexBuffer structure is filled and is valid for the duration of frame, and it can be reused for multiple draw calls.</param>
	    /// <param name="_num">Number of indices to allocate.</param>
	    ///
	    [LinkName("bgfx_alloc_transient_index_buffer")]
	    public static extern void AllocTransientIndexBuffer(TransientIndexBuffer* _tib, uint32 _num);
	    
	    /// <summary>
	    /// Allocate transient vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_tvb">TransientVertexBuffer structure is filled and is valid for the duration of frame, and it can be reused for multiple draw calls.</param>
	    /// <param name="_num">Number of vertices to allocate.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    ///
	    [LinkName("bgfx_alloc_transient_vertex_buffer")]
	    public static extern void AllocTransientVertexBuffer(TransientVertexBuffer* _tvb, uint32 _num, VertexLayout* _layout);
	    
	    /// <summary>
	    /// Check for required space and allocate transient vertex and index
	    /// buffers. If both space requirements are satisfied function returns
	    /// true.
	    /// @remarks
	    ///   Only 16-bit index buffer is supported.
	    /// </summary>
	    ///
	    /// <param name="_tvb">TransientVertexBuffer structure is filled and is valid for the duration of frame, and it can be reused for multiple draw calls.</param>
	    /// <param name="_layout">Vertex layout.</param>
	    /// <param name="_numVertices">Number of vertices to allocate.</param>
	    /// <param name="_tib">TransientIndexBuffer structure is filled and is valid for the duration of frame, and it can be reused for multiple draw calls.</param>
	    /// <param name="_numIndices">Number of indices to allocate.</param>
	    ///
	    [LinkName("bgfx_alloc_transient_buffers")]
	    public static extern bool AllocTransientBuffers(TransientVertexBuffer* _tvb, VertexLayout* _layout, uint32 _numVertices, TransientIndexBuffer* _tib, uint32 _numIndices);
	    
	    /// <summary>
	    /// Allocate instance data buffer.
	    /// </summary>
	    ///
	    /// <param name="_idb">InstanceDataBuffer structure is filled and is valid for duration of frame, and it can be reused for multiple draw calls.</param>
	    /// <param name="_num">Number of instances.</param>
	    /// <param name="_stride">Instance stride. Must be multiple of 16.</param>
	    ///
	    [LinkName("bgfx_alloc_instance_data_buffer")]
	    public static extern void AllocInstanceDataBuffer(InstanceDataBuffer* _idb, uint32 _num, uint16 _stride);
	    
	    /// <summary>
	    /// Create draw indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of indirect calls.</param>
	    ///
	    [LinkName("bgfx_create_indirect_buffer")]
	    public static extern IndirectBufferHandle CreateIndirectBuffer(uint32 _num);
	    
	    /// <summary>
	    /// Destroy draw indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Indirect buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_indirect_buffer")]
	    public static extern void DestoryIndirectBuffer(IndirectBufferHandle _handle);
	    
	    /// <summary>
	    /// Create shader from memory buffer.
	    /// </summary>
	    ///
	    /// <param name="_mem">Shader binary.</param>
	    ///
	    [LinkName("bgfx_create_shader")]
	    public static extern ShaderHandle CreateShader(Memory* _memory);
	    
	    /// <summary>
	    /// Returns the number of uniforms and uniform handles used inside a shader.
	    /// @remarks
	    ///   Only non-predefined uniforms are returned.
	    /// </summary>
	    ///
	    /// <param name="_handle">Shader handle.</param>
	    /// <param name="_uniforms">UniformHandle array where data will be stored.</param>
	    /// <param name="_max">Maximum capacity of array.</param>
	    ///
	    [LinkName("bgfx_get_shader_uniforms")]
	    public static extern uint16 GetShaderUniforms(ShaderHandle _handle, UniformHandle* _uniforms, uint16 _max);
	    
	    /// <summary>
	    /// Set shader debug name.
	    /// </summary>
	    ///
	    /// <param name="_handle">Shader handle.</param>
	    /// <param name="_name">Shader name.</param>
	    /// <param name="_len">Shader name length (if length is INT32_MAX, it's expected that _name is zero terminated string).</param>
	    ///
	    [LinkName("bgfx_set_shader_name")]
	    public static extern void SetShaderName(ShaderHandle _handle, char8* _name, int32 _len);
	    
	    /// <summary>
	    /// Destroy shader.
	    /// @remark Once a shader program is created with _handle,
	    ///   it is safe to destroy that shader.
	    /// </summary>
	    ///
	    /// <param name="_handle">Shader handle.</param>
	    ///
	    [LinkName("bgfx_destroy_shader")]
	    public static extern void DestroyShader(ShaderHandle _handle);
	    
	    /// <summary>
	    /// Create program with vertex and fragment shaders.
	    /// </summary>
	    ///
	    /// <param name="_vsh">Vertex shader.</param>
	    /// <param name="_fsh">Fragment shader.</param>
	    /// <param name="_destroyShaders">If true, shaders will be destroyed when program is destroyed.</param>
	    ///
	    [LinkName("bgfx_create_program")]
	    public static extern ProgramHandle CreateProgram(ShaderHandle _vsh, ShaderHandle _fsh, bool _destroyShaders);
	    
	    /// <summary>
	    /// Create program with compute shader.
	    /// </summary>
	    ///
	    /// <param name="_csh">Compute shader.</param>
	    /// <param name="_destroyShaders">If true, shaders will be destroyed when program is destroyed.</param>
	    ///
	    [LinkName("bgfx_create_compute_program")]
	    public static extern ProgramHandle CreateComputeProgram(ShaderHandle _csh, bool _destroyShaders);
	    
	    /// <summary>
	    /// Destroy program.
	    /// </summary>
	    ///
	    /// <param name="_handle">Program handle.</param>
	    ///
	    [LinkName("bgfx_destroy_program")]
	    public static extern void DestroyProgram(ProgramHandle _handle);
	    
	    /// <summary>
	    /// Validate texture parameters.
	    /// </summary>
	    ///
	    /// <param name="_depth">Depth dimension of volume texture.</param>
	    /// <param name="_cubeMap">Indicates that texture contains cubemap.</param>
	    /// <param name="_numLayers">Number of layers in texture array.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture flags. See `BGFX_TEXTURE_*`.</param>
	    ///
	    [LinkName("bgfx_is_texture_valid")]
	    public static extern bool IsTextureValid(uint16 _depth, bool _cubeMap, uint16 _numLayers, TextureFormat _format, TextureFlags _flags);
	    
	    /// <summary>
	    /// Calculate amount of memory required for texture.
	    /// </summary>
	    ///
	    /// <param name="_info">Resulting texture info structure. See: `TextureInfo`.</param>
	    /// <param name="_width">Width.</param>
	    /// <param name="_height">Height.</param>
	    /// <param name="_depth">Depth dimension of volume texture.</param>
	    /// <param name="_cubeMap">Indicates that texture contains cubemap.</param>
	    /// <param name="_hasMips">Indicates that texture contains full mip-map chain.</param>
	    /// <param name="_numLayers">Number of layers in texture array.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    ///
	    [LinkName("bgfx_calc_texture_size")]
	    public static extern void CalculateTextureSize(TextureInfo* _info, uint16 _width, uint16 _height, uint16 _depth, bool _cubeMap, bool _hasMips, uint16 _numLayers, TextureFormat _format);
	    
	    /// <summary>
	    /// Create texture from memory buffer.
	    /// </summary>
	    ///
	    /// <param name="_mem">DDS, KTX or PVR texture binary data.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    /// <param name="_skip">Skip top level mips when parsing texture.</param>
	    /// <param name="_info">When non-`NULL` is specified it returns parsed texture information.</param>
	    ///
	    [LinkName("bgfx_create_texture")]
	    public static extern TextureHandle CreateTexture(Memory* _memory, TextureFlags _flags, byte _skip, TextureInfo* _info);
	    
	    /// <summary>
	    /// Create 2D texture.
	    /// </summary>
	    ///
	    /// <param name="_width">Width.</param>
	    /// <param name="_height">Height.</param>
	    /// <param name="_hasMips">Indicates that texture contains full mip-map chain.</param>
	    /// <param name="_numLayers">Number of layers in texture array. Must be 1 if caps `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    /// <param name="_mem">Texture data. If `_mem` is non-NULL, created texture will be immutable. If `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than 1, expected memory layout is texture and all mips together for each array element.</param>
	    ///
	    [LinkName("bgfx_create_texture_2d")]
	    public static extern TextureHandle CreateTexture2d(uint16 _width, uint16 _height, bool _hasMips, uint16 _numLayers, TextureFormat _format, TextureFlags _flags, Memory* _memory);
	    
	    /// <summary>
	    /// Create texture with size based on backbuffer ratio. Texture will maintain ratio
	    /// if back buffer resolution changes.
	    /// </summary>
	    ///
	    /// <param name="_ratio">Texture size in respect to back-buffer size. See: `BackbufferRatio::Enum`.</param>
	    /// <param name="_hasMips">Indicates that texture contains full mip-map chain.</param>
	    /// <param name="_numLayers">Number of layers in texture array. Must be 1 if caps `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    ///
	    [LinkName("bgfx_create_texture_2d_scaled")]
	    public static extern TextureHandle CreateTexture2dScaled(BackbufferRatio _ratio, bool _hasMips, uint16 _numLayers, TextureFormat _format, TextureFlags _flags);
	    
	    /// <summary>
	    /// Create 3D texture.
	    /// </summary>
	    ///
	    /// <param name="_width">Width.</param>
	    /// <param name="_height">Height.</param>
	    /// <param name="_depth">Depth.</param>
	    /// <param name="_hasMips">Indicates that texture contains full mip-map chain.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    /// <param name="_mem">Texture data. If `_mem` is non-NULL, created texture will be immutable. If `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than 1, expected memory layout is texture and all mips together for each array element.</param>
	    ///
	    [LinkName("bgfx_create_texture_3d")]
	    public static extern TextureHandle CreateTexture3d(uint16 _width, uint16 _height, uint16 _depth, bool _hasMips, TextureFormat _format, TextureFlags _flags, Memory* _memory);
	    
	    /// <summary>
	    /// Create Cube texture.
	    /// </summary>
	    ///
	    /// <param name="_size">Cube side size.</param>
	    /// <param name="_hasMips">Indicates that texture contains full mip-map chain.</param>
	    /// <param name="_numLayers">Number of layers in texture array. Must be 1 if caps `BGFX_CAPS_TEXTURE_2D_ARRAY` flag is not set.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    /// <param name="_mem">Texture data. If `_mem` is non-NULL, created texture will be immutable. If `_mem` is NULL content of the texture is uninitialized. When `_numLayers` is more than 1, expected memory layout is texture and all mips together for each array element.</param>
	    ///
	    [LinkName("bgfx_create_texture_cube")]
	    public static extern TextureHandle CreateTextureCube(uint16 _size, bool _hasMips, uint16 _numLayers, TextureFormat _format, TextureFlags _flags, Memory* _memory);
	    
	    /// <summary>
	    /// Update 2D texture.
	    /// @attention It's valid to update only mutable texture. See `bgfx::createTexture2D` for more info.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_layer">Layer in texture array.</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_x">X offset in texture.</param>
	    /// <param name="_y">Y offset in texture.</param>
	    /// <param name="_width">Width of texture block.</param>
	    /// <param name="_height">Height of texture block.</param>
	    /// <param name="_mem">Texture update data.</param>
	    /// <param name="_pitch">Pitch of input image (bytes). When _pitch is set to UINT16_MAX, it will be calculated internally based on _width.</param>
	    ///
	    [LinkName("bgfx_update_texture_2d")]
	    public static extern void UpdateTexture2d(TextureHandle _handle, uint16 _layer, byte _mip, uint16 _x, uint16 _y, uint16 _width, uint16 _height, Memory* _memory, uint16 _pitch);
	    
	    /// <summary>
	    /// Update 3D texture.
	    /// @attention It's valid to update only mutable texture. See `bgfx::createTexture3D` for more info.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_x">X offset in texture.</param>
	    /// <param name="_y">Y offset in texture.</param>
	    /// <param name="_z">Z offset in texture.</param>
	    /// <param name="_width">Width of texture block.</param>
	    /// <param name="_height">Height of texture block.</param>
	    /// <param name="_depth">Depth of texture block.</param>
	    /// <param name="_mem">Texture update data.</param>
	    ///
	    [LinkName("bgfx_update_texture_3d")]
	    public static extern void UpdateTexture3d(TextureHandle _handle, byte _mip, uint16 _x, uint16 _y, uint16 _z, uint16 _width, uint16 _height, uint16 _depth, Memory* _memory);
	    
	    /// <summary>
	    /// Update Cube texture.
	    /// @attention It's valid to update only mutable texture. See `bgfx::createTextureCube` for more info.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_layer">Layer in texture array.</param>
	    /// <param name="_side">Cubemap side `BGFX_CUBE_MAP_<POSITIVE or NEGATIVE>_<X, Y or Z>`,   where 0 is +X, 1 is -X, 2 is +Y, 3 is -Y, 4 is +Z, and 5 is -Z.                  +----------+                  |-z       2|                  | ^  +y    |                  | |        |    Unfolded cube:                  | +---->+x |       +----------+----------+----------+----------+       |+y       1|+y       4|+y       0|+y       5|       | ^  -x    | ^  +z    | ^  +x    | ^  -z    |       | |        | |        | |        | |        |       | +---->+z | +---->+x | +---->-z | +---->-x |       +----------+----------+----------+----------+                  |+z       3|                  | ^  -y    |                  | |        |                  | +---->+x |                  +----------+</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_x">X offset in texture.</param>
	    /// <param name="_y">Y offset in texture.</param>
	    /// <param name="_width">Width of texture block.</param>
	    /// <param name="_height">Height of texture block.</param>
	    /// <param name="_mem">Texture update data.</param>
	    /// <param name="_pitch">Pitch of input image (bytes). When _pitch is set to UINT16_MAX, it will be calculated internally based on _width.</param>
	    ///
	    [LinkName("bgfx_update_texture_cube")]
	    public static extern void UpdateTextureCube(TextureHandle _handle, uint16 _layer, byte _side, byte _mip, uint16 _x, uint16 _y, uint16 _width, uint16 _height, Memory* _memory, uint16 _pitch);
	    
	    /// <summary>
	    /// Read back texture content.
	    /// @attention Texture must be created with `BGFX_TEXTURE_READ_BACK` flag.
	    /// @attention Availability depends on: `BGFX_CAPS_TEXTURE_READ_BACK`.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_data">Destination buffer.</param>
	    /// <param name="_mip">Mip level.</param>
	    ///
	    [LinkName("bgfx_read_texture")]
	    public static extern uint32 ReadTexture(TextureHandle _handle, void* _data, byte _mip);
	    
	    /// <summary>
	    /// Set texture debug name.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_name">Texture name.</param>
	    /// <param name="_len">Texture name length (if length is INT32_MAX, it's expected that _name is zero terminated string.</param>
	    ///
	    [LinkName("bgfx_set_texture_name")]
	    public static extern void SetTextureName(TextureHandle _handle, char8* _name, int32 _len);
	    
	    /// <summary>
	    /// Returns texture direct access pointer.
	    /// @attention Availability depends on: `BGFX_CAPS_TEXTURE_DIRECT_ACCESS`. This feature
	    ///   is available on GPUs that have unified memory architecture (UMA) support.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    ///
	    [LinkName("bgfx_get_direct_access_ptr")]
	    public static extern void* GetDirectAccessPtr(TextureHandle _handle);
	    
	    /// <summary>
	    /// Destroy texture.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    ///
	    [LinkName("bgfx_destroy_texture")]
	    public static extern void DestroyTexture(TextureHandle _handle);
	    
	    /// <summary>
	    /// Create frame buffer (simple).
	    /// </summary>
	    ///
	    /// <param name="_width">Texture width.</param>
	    /// <param name="_height">Texture height.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_textureFlags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    ///
	    [LinkName("bgfx_create_frame_buffer")]
	    public static extern FrameBufferHandle CreateFrameBuffer(uint16 _width, uint16 _height, TextureFormat _format, TextureFlags _textureFlags);
	    
	    /// <summary>
	    /// Create frame buffer with size based on backbuffer ratio. Frame buffer will maintain ratio
	    /// if back buffer resolution changes.
	    /// </summary>
	    ///
	    /// <param name="_ratio">Frame buffer size in respect to back-buffer size. See: `BackbufferRatio::Enum`.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_textureFlags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    ///
	    [LinkName("bgfx_create_frame_buffer_scaled")]
	    public static extern FrameBufferHandle CreateFrameBufferScaled(BackbufferRatio _ratio, TextureFormat _format, TextureFlags _textureFlags);
	    
	    /// <summary>
	    /// Create MRT frame buffer from texture handles (simple).
	    /// </summary>
	    ///
	    /// <param name="_num">Number of texture handles.</param>
	    /// <param name="_handles">Texture attachments.</param>
	    /// <param name="_destroyTexture">If true, textures will be destroyed when frame buffer is destroyed.</param>
	    ///
	    [LinkName("bgfx_create_frame_buffer_from_handles")]
	    public static extern FrameBufferHandle CreateFrameBufferFromHandles(byte _num, TextureHandle* _handles, bool _destroyTexture);
	    
	    /// <summary>
	    /// Create MRT frame buffer from texture handles with specific layer and
	    /// mip level.
	    /// </summary>
	    ///
	    /// <param name="_num">Number of attachements.</param>
	    /// <param name="_attachment">Attachment texture info. See: `bgfx::Attachment`.</param>
	    /// <param name="_destroyTexture">If true, textures will be destroyed when frame buffer is destroyed.</param>
	    ///
	    [LinkName("bgfx_create_frame_buffer_from_attachment")]
	    public static extern FrameBufferHandle CreateFrameBufferFromAttachment(byte _num, Attachment* _attachment, bool _destroyTexture);
	    
	    /// <summary>
	    /// Create frame buffer for multiple window rendering.
	    /// @remarks
	    ///   Frame buffer cannot be used for sampling.
	    /// @attention Availability depends on: `BGFX_CAPS_SWAP_CHAIN`.
	    /// </summary>
	    ///
	    /// <param name="_nwh">OS' target native window handle.</param>
	    /// <param name="_width">Window back buffer width.</param>
	    /// <param name="_height">Window back buffer height.</param>
	    /// <param name="_format">Window back buffer color format.</param>
	    /// <param name="_depthFormat">Window back buffer depth format.</param>
	    ///
	    [LinkName("bgfx_create_frame_buffer_from_nwh")]
	    public static extern FrameBufferHandle CreateFrameBufferFromNwh(void* _nwh, uint16 _width, uint16 _height, TextureFormat _format, TextureFormat _depthFormat);
	    
	    /// <summary>
	    /// Set frame buffer debug name.
	    /// </summary>
	    ///
	    /// <param name="_handle">Frame buffer handle.</param>
	    /// <param name="_name">Frame buffer name.</param>
	    /// <param name="_len">Frame buffer name length (if length is INT32_MAX, it's expected that _name is zero terminated string.</param>
	    ///
	    [LinkName("bgfx_set_frame_buffer_name")]
	    public static extern void SetFrameBufferName(FrameBufferHandle _handle, char8* _name, int32 _len);
	    
	    /// <summary>
	    /// Obtain texture handle of frame buffer attachment.
	    /// </summary>
	    ///
	    /// <param name="_handle">Frame buffer handle.</param>
	    ///
	    [LinkName("bgfx_get_texture")]
	    public static extern TextureHandle GetTexture(FrameBufferHandle _handle, byte _attachment);
	    
	    /// <summary>
	    /// Destroy frame buffer.
	    /// </summary>
	    ///
	    /// <param name="_handle">Frame buffer handle.</param>
	    ///
	    [LinkName("bgfx_destroy_frame_buffer")]
	    public static extern void DestroyFrameBuffer(FrameBufferHandle _handle);
	    
	    /// <summary>
	    /// Create shader uniform parameter.
	    /// @remarks
	    ///   1. Uniform names are unique. It's valid to call `bgfx::createUniform`
	    ///      multiple times with the same uniform name. The library will always
	    ///      return the same handle, but the handle reference count will be
	    ///      incremented. This means that the same number of `bgfx::destroyUniform`
	    ///      must be called to properly destroy the uniform.
	    ///   2. Predefined uniforms (declared in `bgfx_shader.sh`):
	    ///      - `u_viewRect vec4(x, y, width, height)` - view rectangle for current
	    ///        view, in pixels.
	    ///      - `u_viewTexel vec4(1.0/width, 1.0/height, undef, undef)` - inverse
	    ///        width and height
	    ///      - `u_view mat4` - view matrix
	    ///      - `u_invView mat4` - inverted view matrix
	    ///      - `u_proj mat4` - projection matrix
	    ///      - `u_invProj mat4` - inverted projection matrix
	    ///      - `u_viewProj mat4` - concatenated view projection matrix
	    ///      - `u_invViewProj mat4` - concatenated inverted view projection matrix
	    ///      - `u_model mat4[BGFX_CONFIG_MAX_BONES]` - array of model matrices.
	    ///      - `u_modelView mat4` - concatenated model view matrix, only first
	    ///        model matrix from array is used.
	    ///      - `u_modelViewProj mat4` - concatenated model view projection matrix.
	    ///      - `u_alphaRef float` - alpha reference value for alpha test.
	    /// </summary>
	    ///
	    /// <param name="_name">Uniform name in shader.</param>
	    /// <param name="_type">Type of uniform (See: `bgfx::UniformType`).</param>
	    /// <param name="_num">Number of elements in array.</param>
	    ///
	    [LinkName("bgfx_create_uniform")]
	    public static extern UniformHandle CreateUniform(char8* _name, UniformType _type, uint16 _num);
	    
	    /// <summary>
	    /// Retrieve uniform info.
	    /// </summary>
	    ///
	    /// <param name="_handle">Handle to uniform object.</param>
	    /// <param name="_info">Uniform info.</param>
	    ///
	    [LinkName("bgfx_get_uniform_info")]
	    public static extern void GetUniformInfo(UniformHandle _handle, UniformInfo* _info);
	    
	    /// <summary>
	    /// Destroy shader uniform parameter.
	    /// </summary>
	    ///
	    /// <param name="_handle">Handle to uniform object.</param>
	    ///
	    [LinkName("bgfx_destroy_uniform")]
	    public static extern void DestroyUniform(UniformHandle _handle);
	    
	    /// <summary>
	    /// Create occlusion query.
	    /// </summary>
	    ///
	    [LinkName("bgfx_create_occlusion_query")]
	    public static extern OcclusionQueryHandle CreateOcculusionQuery();
	    
	    /// <summary>
	    /// Retrieve occlusion query result from previous frame.
	    /// </summary>
	    ///
	    /// <param name="_handle">Handle to occlusion query object.</param>
	    /// <param name="_result">Number of pixels that passed test. This argument can be `NULL` if result of occlusion query is not needed.</param>
	    ///
	    [LinkName("bgfx_get_result")]
	    public static extern OcclusionQueryResult GetResult(OcclusionQueryHandle _handle, int* _result);
	    
	    /// <summary>
	    /// Destroy occlusion query.
	    /// </summary>
	    ///
	    /// <param name="_handle">Handle to occlusion query object.</param>
	    ///
	    [LinkName("bgfx_destroy_occlusion_query")]
	    public static extern void DestroyOcclusionQuery(OcclusionQueryHandle _handle);
	    
	    /// <summary>
	    /// Set palette color value.
	    /// </summary>
	    ///
	    /// <param name="_index">Index into palette.</param>
	    /// <param name="_rgba">RGBA floating point values.</param>
	    ///
	    [LinkName("bgfx_set_palette_color")]
	    public static extern void SetPaletteColor(byte _index, float _rgba);
	    
	    /// <summary>
	    /// Set palette color value.
	    /// </summary>
	    ///
	    /// <param name="_index">Index into palette.</param>
	    /// <param name="_rgba">Packed 32-bit RGBA value.</param>
	    ///
	    [LinkName("bgfx_set_palette_color_rgba8")]
	    public static extern void SetPaletteColorRgba8(byte _index, uint32 _rgba);
	    
	    /// <summary>
	    /// Set view name.
	    /// @remarks
	    ///   This is debug only feature.
	    ///   In graphics debugger view name will appear as:
	    ///       "nnnc <view name>"
	    ///        ^  ^ ^
	    ///        |  +--- compute (C)
	    ///        +------ view id
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_name">View name.</param>
	    ///
	    [LinkName("bgfx_set_view_name")]
	    public static extern void SetViewName(ViewId _id, char8* _name);
	    
	    /// <summary>
	    /// Set view rectangle. Draw primitive outside view will be clipped.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_width">Width of view port region.</param>
	    /// <param name="_height">Height of view port region.</param>
	    ///
	    [LinkName("bgfx_set_view_rect")]
	    public static extern void SetViewRect(uint16 _id, uint16 _x, uint16 _y, uint16 _width, uint16 _height);
	    
	    /// <summary>
	    /// Set view rectangle. Draw primitive outside view will be clipped.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_ratio">Width and height will be set in respect to back-buffer size. See: `BackbufferRatio::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_view_rect_ratio")]
	    public static extern void SetViewRectRatio(uint16 _id, uint16 _x, uint16 _y, BackbufferRatio _ratio);
	    
	    /// <summary>
	    /// Set view scissor. Draw primitive outside view will be clipped. When
	    /// _x, _y, _width and _height are set to 0, scissor will be disabled.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_width">Width of view scissor region.</param>
	    /// <param name="_height">Height of view scissor region.</param>
	    ///
	    [LinkName("bgfx_set_view_scissor")]
	    public static extern void SetViewScissor(ViewId _id, uint16 _x, uint16 _y, uint16 _width, uint16 _height);
	    
	    /// <summary>
	    /// Set view clear flags.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_flags">Clear flags. Use `BGFX_CLEAR_NONE` to remove any clear operation. See: `BGFX_CLEAR_*`.</param>
	    /// <param name="_rgba">Color clear value.</param>
	    /// <param name="_depth">Depth clear value.</param>
	    /// <param name="_stencil">Stencil clear value.</param>
	    ///
	    [LinkName("bgfx_set_view_clear")]
	    public static extern void SetViewClear(ViewId _id, ClearFlags _flags, uint32 _rgba, float _depth, byte _stencil);
	    
	    /// <summary>
	    /// Set view clear flags with different clear color for each
	    /// frame buffer texture. Must use `bgfx::setPaletteColor` to setup clear color
	    /// palette.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_flags">Clear flags. Use `BGFX_CLEAR_NONE` to remove any clear operation. See: `BGFX_CLEAR_*`.</param>
	    /// <param name="_depth">Depth clear value.</param>
	    /// <param name="_stencil">Stencil clear value.</param>
	    /// <param name="_c0">Palette index for frame buffer attachment 0.</param>
	    /// <param name="_c1">Palette index for frame buffer attachment 1.</param>
	    /// <param name="_c2">Palette index for frame buffer attachment 2.</param>
	    /// <param name="_c3">Palette index for frame buffer attachment 3.</param>
	    /// <param name="_c4">Palette index for frame buffer attachment 4.</param>
	    /// <param name="_c5">Palette index for frame buffer attachment 5.</param>
	    /// <param name="_c6">Palette index for frame buffer attachment 6.</param>
	    /// <param name="_c7">Palette index for frame buffer attachment 7.</param>
	    ///
	    [LinkName("bgfx_set_view_clear_mrt")]
	    public static extern void SetViewClearMrt(ViewId _id, ClearFlags _flags, float _depth, byte _stencil, byte _c0, byte _c1, byte _c2, byte _c3, byte _c4, byte _c5, byte _c6, byte _c7);
	    
	    /// <summary>
	    /// Set view sorting mode.
	    /// @remarks
	    ///   View mode must be set prior calling `bgfx::submit` for the view.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_mode">View sort mode. See `ViewMode::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_view_mode")]
	    public static extern void SetViewMode(ViewId _id, ViewMode _mode);
	    
	    /// <summary>
	    /// Set view frame buffer.
	    /// @remarks
	    ///   Not persistent after `bgfx::reset` call.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_handle">Frame buffer handle. Passing `BGFX_INVALID_HANDLE` as frame buffer handle will draw primitives from this view into default back buffer.</param>
	    ///
	    [LinkName("bgfx_set_view_frame_buffer")]
	    public static extern void SetViewFrameBuffer(ViewId _id, FrameBufferHandle _handle);
	    
	    /// <summary>
	    /// Set view view and projection matrices, all draw primitives in this
	    /// view will use these matrices.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_view">View matrix.</param>
	    /// <param name="_proj">Projection matrix.</param>
	    ///
	    [LinkName("bgfx_set_view_transform")]
	    public static extern void SetViewTransform(ViewId _id, MatrixPtr _view, MatrixPtr _proj);
	    
	    /// <summary>
	    /// Post submit view reordering.
	    /// </summary>
	    ///
	    /// <param name="_id">First view id.</param>
	    /// <param name="_num">Number of views to remap.</param>
	    /// <param name="_order">View remap id table. Passing `NULL` will reset view ids to default state.</param>
	    ///
	    [LinkName("bgfx_set_view_order")]
	    public static extern void SetViewOrder(ViewId _id, uint16 _num, uint16* _order);
	    
	    /// <summary>
	    /// Reset all view settings to default.
	    /// </summary>
	    ///
	    [LinkName("bgfx_reset_view")]
	    public static extern void ResetView(ViewId _id);
	    
	    /// <summary>
	    /// Begin submitting draw calls from thread.
	    /// </summary>
	    ///
	    /// <param name="_forThread">Explicitly request an encoder for a worker thread.</param>
	    ///
	    [LinkName("bgfx_encoder_begin")]
	    public static extern Encoder* EncoderBegin(bool _forThread);
	    
	    /// <summary>
	    /// End submitting draw calls from thread.
	    /// </summary>
	    ///
	    /// <param name="_encoder">Encoder.</param>
	    ///
	    [LinkName("bgfx_encoder_end")]
	    public static extern void EncoderEnd(Encoder* _encoder);
	    
	    /// <summary>
	    /// Sets a debug marker. This allows you to group graphics calls together for easy browsing in
	    /// graphics debugging tools.
	    /// </summary>
	    ///
	    /// <param name="_marker">Marker string.</param>
	    ///
	    [LinkName("bgfx_encoder_set_marker")]
	    public static extern void EncoderSetMarker(Encoder* _encoder, char8* _marker);
	    
	    /// <summary>
	    /// Set render states for draw primitive.
	    /// @remarks
	    ///   1. To setup more complex states use:
	    ///      `BGFX_STATE_ALPHA_REF(_ref)`,
	    ///      `BGFX_STATE_POINT_SIZE(_size)`,
	    ///      `BGFX_STATE_BLEND_FUNC(_src, _dst)`,
	    ///      `BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)`,
	    ///      `BGFX_STATE_BLEND_EQUATION(_equation)`,
	    ///      `BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)`
	    ///   2. `BGFX_STATE_BLEND_EQUATION_ADD` is set when no other blend
	    ///      equation is specified.
	    /// </summary>
	    ///
	    /// <param name="_state">State flags. Default state for primitive type is   triangles. See: `BGFX_STATE_DEFAULT`.   - `BGFX_STATE_DEPTH_TEST_*` - Depth test function.   - `BGFX_STATE_BLEND_*` - See remark 1 about BGFX_STATE_BLEND_FUNC.   - `BGFX_STATE_BLEND_EQUATION_*` - See remark 2.   - `BGFX_STATE_CULL_*` - Backface culling mode.   - `BGFX_STATE_WRITE_*` - Enable R, G, B, A or Z write.   - `BGFX_STATE_MSAA` - Enable hardware multisample antialiasing.   - `BGFX_STATE_PT_[TRISTRIP/LINES/POINTS]` - Primitive type.</param>
	    /// <param name="_rgba">Sets blend factor used by `BGFX_STATE_BLEND_FACTOR` and   `BGFX_STATE_BLEND_INV_FACTOR` blend modes.</param>
	    ///
	    [LinkName("bgfx_encoder_set_state")]
	    public static extern void EncoderSetState(Encoder* _encoder, StateFlags _state, uint32 _rgba);
	    
	    /// <summary>
	    /// Set condition for rendering.
	    /// </summary>
	    ///
	    /// <param name="_handle">Occlusion query handle.</param>
	    /// <param name="_visible">Render if occlusion query is visible.</param>
	    ///
	    [LinkName("bgfx_encoder_set_condition")]
	    public static extern void EncoderSetCondition(Encoder* _encoder, OcclusionQueryHandle _handle, bool _visible);
	    
	    /// <summary>
	    /// Set stencil test state.
	    /// </summary>
	    ///
	    /// <param name="_fstencil">Front stencil state.</param>
	    /// <param name="_bstencil">Back stencil state. If back is set to `BGFX_STENCIL_NONE` _fstencil is applied to both front and back facing primitives.</param>
	    ///
	    [LinkName("bgfx_encoder_set_stencil")]
	    public static extern void EncoderSetStencil(Encoder* _encoder, StencilFlags _fstencil, StencilFlags _bstencil);
	    
	    /// <summary>
	    /// Set scissor for draw primitive.
	    /// @remark
	    ///   To scissor for all primitives in view see `bgfx::setViewScissor`.
	    /// </summary>
	    ///
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_width">Width of view scissor region.</param>
	    /// <param name="_height">Height of view scissor region.</param>
	    ///
	    [LinkName("bgfx_encoder_set_scissor")]
	    public static extern uint16 EncoderSetScissor(Encoder* _encoder, uint16 _x, uint16 _y, uint16 _width, uint16 _height);
	    
	    /// <summary>
	    /// Set scissor from cache for draw primitive.
	    /// @remark
	    ///   To scissor for all primitives in view see `bgfx::setViewScissor`.
	    /// </summary>
	    ///
	    /// <param name="_cache">Index in scissor cache.</param>
	    ///
	    [LinkName("bgfx_encoder_set_scissor_cached")]
	    public static extern void EncoderSetScissorCached(Encoder* _encoder, uint16 _cache);
	    
	    /// <summary>
	    /// Set model matrix for draw primitive. If it is not called,
	    /// the model will be rendered with an identity model matrix.
	    /// </summary>
	    ///
	    /// <param name="_mtx">Pointer to first matrix in array.</param>
	    /// <param name="_num">Number of matrices in array.</param>
	    ///
	    [LinkName("bgfx_encoder_set_transform")]
	    public static extern uint32 EncoderSetTransform(Encoder* _encoder, MatrixPtr _mtx, uint16 _num);
	    
	    /// <summary>
	    ///  Set model matrix from matrix cache for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_cache">Index in matrix cache.</param>
	    /// <param name="_num">Number of matrices from cache.</param>
	    ///
	    [LinkName("bgfx_encoder_set_transform_cached")]
	    public static extern void EncoderSetTransformCached(Encoder* _encoder, uint32 _cache, uint16 _num);
	    
	    /// <summary>
	    /// Reserve matrices in internal matrix cache.
	    /// @attention Pointer returned can be modifed until `bgfx::frame` is called.
	    /// </summary>
	    ///
	    /// <param name="_transform">Pointer to `Transform` structure.</param>
	    /// <param name="_num">Number of matrices.</param>
	    ///
	    [LinkName("bgfx_encoder_alloc_transform")]
	    public static extern uint32 EncoderAllocTransform(Encoder* _encoder, Transform* _transform, uint16 _num);
	    
	    /// <summary>
	    /// Set shader uniform parameter for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Uniform.</param>
	    /// <param name="_value">Pointer to uniform data.</param>
	    /// <param name="_num">Number of elements. Passing `UINT16_MAX` will use the _num passed on uniform creation.</param>
	    ///
	    [LinkName("bgfx_encoder_set_uniform")]
	    public static extern void EncoderSetUniform(Encoder* _encoder, UniformHandle _handle, void* _value, uint16 _num);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_encoder_set_index_buffer")]
	    public static extern void EncoderSetIndexBuffer(Encoder* _encoder, IndexBufferHandle _handle, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_encoder_set_dynamic_index_buffer")]
	    public static extern void EncoderSetDynamicIndexBuffer(Encoder* _encoder, DynamicIndexBufferHandle _handle, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_tib">Transient index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_encoder_set_transient_index_buffer")]
	    public static extern void EncoderSetTransientIndexBuffer(Encoder* _encoder, TransientIndexBuffer* _tib, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_handle">Vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    /// <param name="_layoutHandle">Vertex layout for aliasing vertex buffer. If invalid handle is used, vertex layout used for creation of vertex buffer will be used.</param>
	    ///
	    [LinkName("bgfx_encoder_set_vertex_buffer")]
	    public static extern void EncoderSetVertexBuffer(Encoder* _encoder, byte _stream, VertexBufferHandle _handle, uint32 _startVertex, uint32 _numVertices, VertexLayoutHandle _layoutHandle);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_handle">Dynamic vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    /// <param name="_layoutHandle">Vertex layout for aliasing vertex buffer. If invalid handle is used, vertex layout used for creation of vertex buffer will be used.</param>
	    ///
	    [LinkName("bgfx_encoder_set_dynamic_vertex_buffer")]
	    public static extern void EncoderSetDynamicVertexBuffer(Encoder* _encoder, byte _stream, DynamicVertexBufferHandle _handle, uint32 _startVertex, uint32 _numVertices, VertexLayoutHandle _layoutHandle);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_tvb">Transient vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    /// <param name="_layoutHandle">Vertex layout for aliasing vertex buffer. If invalid handle is used, vertex layout used for creation of vertex buffer will be used.</param>
	    ///
	    [LinkName("bgfx_encoder_set_transient_vertex_buffer")]
	    public static extern void EncoderSetTransientVertexBuffer(Encoder* _encoder, byte _stream, TransientVertexBuffer* _tvb, uint32 _startVertex, uint32 _numVertices, VertexLayoutHandle _layoutHandle);
	    
	    /// <summary>
	    /// Set number of vertices for auto generated vertices use in conjuction
	    /// with gl_VertexID.
	    /// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
	    /// </summary>
	    ///
	    /// <param name="_numVertices">Number of vertices.</param>
	    ///
	    [LinkName("bgfx_encoder_set_vertex_count")]
	    public static extern void EncoderSetVertexCount(Encoder* _encoder, uint32 _numVertices);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_idb">Transient instance data buffer.</param>
	    /// <param name="_start">First instance data.</param>
	    /// <param name="_num">Number of data instances.</param>
	    ///
	    [LinkName("bgfx_encoder_set_instance_data_buffer")]
	    public static extern void EncoderSetInstanceDataBuffer(Encoder* _encoder, InstanceDataBuffer* _idb, uint32 _start, uint32 _num);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Vertex buffer.</param>
	    /// <param name="_startVertex">First instance data.</param>
	    /// <param name="_num">Number of data instances. Set instance data buffer for draw primitive.</param>
	    ///
	    [LinkName("bgfx_encoder_set_instance_data_from_vertex_buffer")]
	    public static extern void EncoderSetInstanceDataFromVertexBuffer(Encoder* _encoder, VertexBufferHandle _handle, uint32 _startVertex, uint32 _num);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic vertex buffer.</param>
	    /// <param name="_startVertex">First instance data.</param>
	    /// <param name="_num">Number of data instances.</param>
	    ///
	    [LinkName("bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer")]
	    public static extern void EncoderSetInstanceDataFromDynamicVertexBuffer(Encoder* _encoder, DynamicVertexBufferHandle _handle, uint32 _startVertex, uint32 _num);
	    
	    /// <summary>
	    /// Set number of instances for auto generated instances use in conjuction
	    /// with gl_InstanceID.
	    /// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
	    /// </summary>
	    ///
	    [LinkName("bgfx_encoder_set_instance_count")]
	    public static extern void EncoderSetInstanceCount(Encoder* _encoder, uint32 _numInstances);
	    
	    /// <summary>
	    /// Set texture stage for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stage">Texture unit.</param>
	    /// <param name="_sampler">Program sampler.</param>
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_flags">Texture sampling mode. Default value UINT32_MAX uses   texture sampling settings from the texture.   - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap     mode.   - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic     sampling.</param>
	    ///
	    [LinkName("bgfx_encoder_set_texture")]
	    public static extern void EncoderSetTexture(Encoder* _encoder, byte _stage, UniformHandle _sampler, TextureHandle _handle, SamplerFlags _flags);
	    
	    /// <summary>
	    /// Submit an empty primitive for rendering. Uniforms and draw state
	    /// will be applied but no geometry will be submitted. Useful in cases
	    /// when no other draw/compute primitive is submitted to view, but it's
	    /// desired to execute clear view.
	    /// @remark
	    ///   These empty draw calls will sort before ordinary draw calls.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    ///
	    [LinkName("bgfx_encoder_touch")]
	    public static extern void EncoderTouch(Encoder* _encoder, ViewId _id);
	    
	    /// <summary>
	    /// Submit primitive for rendering.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_submit")]
	    public static extern void EncoderSubmit(Encoder* _encoder, ViewId _id, ProgramHandle _program, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Submit primitive with occlusion query for rendering.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_occlusionQuery">Occlusion query.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_submit_occlusion_query")]
	    public static extern void EncoderSubmitOcclusionQuery(Encoder* _encoder, ViewId _id, ProgramHandle _program, OcclusionQueryHandle _occlusionQuery, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Submit primitive for rendering with index and instance data info from
	    /// indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_indirectHandle">Indirect buffer.</param>
	    /// <param name="_start">First element in indirect buffer.</param>
	    /// <param name="_num">Number of dispatches.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_submit_indirect")]
	    public static extern void EncoderSubmitIndirect(Encoder* _encoder, ViewId _id, ProgramHandle _program, IndirectBufferHandle _indirectHandle, uint16 _start, uint16 _num, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Set compute index buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Index buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_compute_index_buffer")]
	    public static extern void EncoderSetComputeIndexBuffer(Encoder* _encoder, byte _stage, IndexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Vertex buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_compute_vertex_buffer")]
	    public static extern void EncoderSetComputeVertexBuffer(Encoder* _encoder, byte _stage, VertexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute dynamic index buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Dynamic index buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_compute_dynamic_index_buffer")]
	    public static extern void EncoderSetComputeDynamicIndexBuffer(Encoder* _encoder, byte _stage, DynamicIndexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute dynamic vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Dynamic vertex buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_compute_dynamic_vertex_buffer")]
	    public static extern void EncoderSetComputeDynamicVertexBuffer(Encoder* _encoder, byte _stage, DynamicVertexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Indirect buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_compute_indirect_buffer")]
	    public static extern void EncoderSetComputeIndirectBuffer(Encoder* _encoder, byte _stage, IndirectBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute image from texture.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_access">Image access. See `Access::Enum`.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    ///
	    [LinkName("bgfx_encoder_set_image")]
	    public static extern void EncoderSetImage(Encoder* _encoder, byte _stage, TextureHandle _handle, byte _mip, Access _access, TextureFormat _format);
	    
	    /// <summary>
	    /// Dispatch compute.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Compute program.</param>
	    /// <param name="_numX">Number of groups X.</param>
	    /// <param name="_numY">Number of groups Y.</param>
	    /// <param name="_numZ">Number of groups Z.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_dispatch")]
	    public static extern void EncoderDispatch(Encoder* _encoder, ViewId _id, ProgramHandle _program, uint32 _numX, uint32 _numY, uint32 _numZ, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Dispatch compute indirect.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Compute program.</param>
	    /// <param name="_indirectHandle">Indirect buffer.</param>
	    /// <param name="_start">First element in indirect buffer.</param>
	    /// <param name="_num">Number of dispatches.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_dispatch_indirect")]
	    public static extern void EncoderDispatchIndirect(Encoder* _encoder, ViewId _id, ProgramHandle _program, IndirectBufferHandle _indirectHandle, uint16 _start, uint16 _num, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Discard previously set state for draw or compute call.
	    /// </summary>
	    ///
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_encoder_discard")]
	    public static extern void EncoderDiscard(Encoder* _encoder, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Blit 2D texture region between two 2D textures.
	    /// @attention Destination texture must be created with `BGFX_TEXTURE_BLIT_DST` flag.
	    /// @attention Availability depends on: `BGFX_CAPS_TEXTURE_BLIT`.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_dst">Destination texture handle.</param>
	    /// <param name="_dstMip">Destination texture mip level.</param>
	    /// <param name="_dstX">Destination texture X position.</param>
	    /// <param name="_dstY">Destination texture Y position.</param>
	    /// <param name="_dstZ">If texture is 2D this argument should be 0. If destination texture is cube this argument represents destination texture cube face. For 3D texture this argument represents destination texture Z position.</param>
	    /// <param name="_src">Source texture handle.</param>
	    /// <param name="_srcMip">Source texture mip level.</param>
	    /// <param name="_srcX">Source texture X position.</param>
	    /// <param name="_srcY">Source texture Y position.</param>
	    /// <param name="_srcZ">If texture is 2D this argument should be 0. If source texture is cube this argument represents source texture cube face. For 3D texture this argument represents source texture Z position.</param>
	    /// <param name="_width">Width of region.</param>
	    /// <param name="_height">Height of region.</param>
	    /// <param name="_depth">If texture is 3D this argument represents depth of region, otherwise it's unused.</param>
	    ///
	    [LinkName("bgfx_encoder_blit")]
	    public static extern void EncoderBlit(Encoder* _encoder, ViewId _id, TextureHandle _dst, byte _dstMip, uint16 _dstX, uint16 _dstY, uint16 _dstZ, TextureHandle _src, byte _srcMip, uint16 _srcX, uint16 _srcY, uint16 _srcZ, uint16 _width, uint16 _height, uint16 _depth);
	    
	    /// <summary>
	    /// Request screen shot of window back buffer.
	    /// @remarks
	    ///   `bgfx::CallbackI::screenShot` must be implemented.
	    /// @attention Frame buffer handle must be created with OS' target native window handle.
	    /// </summary>
	    ///
	    /// <param name="_handle">Frame buffer handle. If handle is `BGFX_INVALID_HANDLE` request will be made for main window back buffer.</param>
	    /// <param name="_filePath">Will be passed to `bgfx::CallbackI::screenShot` callback.</param>
	    ///
	    [LinkName("bgfx_request_screen_shot")]
	    public static extern void RequestScreenShort(FrameBufferHandle _handle, char8* _filePath);
	    
	    /// <summary>
	    /// Render frame.
	    /// @attention `bgfx::renderFrame` is blocking call. It waits for
	    ///   `bgfx::frame` to be called from API thread to process frame.
	    ///   If timeout value is passed call will timeout and return even
	    ///   if `bgfx::frame` is not called.
	    /// @warning This call should be only used on platforms that don't
	    ///   allow creating separate rendering thread. If it is called before
	    ///   to bgfx::init, render thread won't be created by bgfx::init call.
	    /// </summary>
	    ///
	    /// <param name="_msecs">Timeout in milliseconds.</param>
	    ///
	    [LinkName("bgfx_render_frame")]
	    public static extern RenderFrame RenderFrame(int32 _msecs = 0);
	    
	    /// <summary>
	    /// Set platform data.
	    /// @warning Must be called before `bgfx::init`.
	    /// </summary>
	    ///
	    /// <param name="_data">Platform data.</param>
	    ///
	    [LinkName("bgfx_set_platform_data")]
	    public static extern void SetPlatformData(PlatformData* _data);
	    
	    /// <summary>
	    /// Get internal data for interop.
	    /// @attention It's expected you understand some bgfx internals before you
	    ///   use this call.
	    /// @warning Must be called only on render thread.
	    /// </summary>
	    ///
	    [LinkName("bgfx_get_internal_data")]
	    public static extern InternalData* GetInternalData();
	    
	    /// <summary>
	    /// Override internal texture with externally created texture. Previously
	    /// created internal texture will released.
	    /// @attention It's expected you understand some bgfx internals before you
	    ///   use this call.
	    /// @warning Must be called only on render thread.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_ptr">Native API pointer to texture.</param>
	    ///
	    [LinkName("bgfx_override_internal_texture_ptr")]
	    public static extern void* OverrideInternalTexturePtr(TextureHandle _handle, void* _ptr);
	    
	    /// <summary>
	    /// Override internal texture by creating new texture. Previously created
	    /// internal texture will released.
	    /// @attention It's expected you understand some bgfx internals before you
	    ///   use this call.
	    /// @returns Native API pointer to texture. If result is 0, texture is not created yet from the
	    ///   main thread.
	    /// @warning Must be called only on render thread.
	    /// </summary>
	    ///
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_width">Width.</param>
	    /// <param name="_height">Height.</param>
	    /// <param name="_numMips">Number of mip-maps.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    /// <param name="_flags">Texture creation (see `BGFX_TEXTURE_*`.), and sampler (see `BGFX_SAMPLER_*`) flags. Default texture sampling mode is linear, and wrap mode is repeat. - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap   mode. - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic   sampling.</param>
	    ///
	    [LinkName("bgfx_override_internal_texture")]
	    public static extern void* OverrideInternalTexture(TextureHandle _handle, uint16 _width, uint16 _height, byte _numMips, TextureFormat _format, TextureFlags _flags);
	    
	    /// <summary>
	    /// Sets a debug marker. This allows you to group graphics calls together for easy browsing in
	    /// graphics debugging tools.
	    /// </summary>
	    ///
	    /// <param name="_marker">Marker string.</param>
	    ///
	    [LinkName("bgfx_set_marker")]
	    public static extern void SetMarker(char8* _marker);
	    
	    /// <summary>
	    /// Set render states for draw primitive.
	    /// @remarks
	    ///   1. To setup more complex states use:
	    ///      `BGFX_STATE_ALPHA_REF(_ref)`,
	    ///      `BGFX_STATE_POINT_SIZE(_size)`,
	    ///      `BGFX_STATE_BLEND_FUNC(_src, _dst)`,
	    ///      `BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)`,
	    ///      `BGFX_STATE_BLEND_EQUATION(_equation)`,
	    ///      `BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)`
	    ///   2. `BGFX_STATE_BLEND_EQUATION_ADD` is set when no other blend
	    ///      equation is specified.
	    /// </summary>
	    ///
	    /// <param name="_state">State flags. Default state for primitive type is   triangles. See: `BGFX_STATE_DEFAULT`.   - `BGFX_STATE_DEPTH_TEST_*` - Depth test function.   - `BGFX_STATE_BLEND_*` - See remark 1 about BGFX_STATE_BLEND_FUNC.   - `BGFX_STATE_BLEND_EQUATION_*` - See remark 2.   - `BGFX_STATE_CULL_*` - Backface culling mode.   - `BGFX_STATE_WRITE_*` - Enable R, G, B, A or Z write.   - `BGFX_STATE_MSAA` - Enable hardware multisample antialiasing.   - `BGFX_STATE_PT_[TRISTRIP/LINES/POINTS]` - Primitive type.</param>
	    /// <param name="_rgba">Sets blend factor used by `BGFX_STATE_BLEND_FACTOR` and   `BGFX_STATE_BLEND_INV_FACTOR` blend modes.</param>
	    ///
	    [LinkName("bgfx_set_state")]
	    public static extern void SetState(StateFlags _state, uint32 _rgba);
	    
	    /// <summary>
	    /// Set condition for rendering.
	    /// </summary>
	    ///
	    /// <param name="_handle">Occlusion query handle.</param>
	    /// <param name="_visible">Render if occlusion query is visible.</param>
	    ///
	    [LinkName("bgfx_set_condition")]
	    public static extern void SetCondition(OcclusionQueryHandle _handle, bool _visible);
	    
	    /// <summary>
	    /// Set stencil test state.
	    /// </summary>
	    ///
	    /// <param name="_fstencil">Front stencil state.</param>
	    /// <param name="_bstencil">Back stencil state. If back is set to `BGFX_STENCIL_NONE` _fstencil is applied to both front and back facing primitives.</param>
	    ///
	    [LinkName("bgfx_set_stencil")]
	    public static extern void SetStencil(StencilFlags _fstencil, StencilFlags _bstencil);
	    
	    /// <summary>
	    /// Set scissor for draw primitive.
	    /// @remark
	    ///   To scissor for all primitives in view see `bgfx::setViewScissor`.
	    /// </summary>
	    ///
	    /// <param name="_x">Position x from the left corner of the window.</param>
	    /// <param name="_y">Position y from the top corner of the window.</param>
	    /// <param name="_width">Width of view scissor region.</param>
	    /// <param name="_height">Height of view scissor region.</param>
	    ///
	    [LinkName("bgfx_set_scissor")]
	    public static extern uint16 SetScissor(uint16 _x, uint16 _y, uint16 _width, uint16 _height);
	    
	    /// <summary>
	    /// Set scissor from cache for draw primitive.
	    /// @remark
	    ///   To scissor for all primitives in view see `bgfx::setViewScissor`.
	    /// </summary>
	    ///
	    /// <param name="_cache">Index in scissor cache.</param>
	    ///
	    [LinkName("bgfx_set_scissor_cached")]
	    public static extern void SetScissorCached(uint16 _cache);
	    
	    /// <summary>
	    /// Set model matrix for draw primitive. If it is not called,
	    /// the model will be rendered with an identity model matrix.
	    /// </summary>
	    ///
	    /// <param name="_mtx">Pointer to first matrix in array.</param>
	    /// <param name="_num">Number of matrices in array.</param>
	    ///
	    [LinkName("bgfx_set_transform")]
	    public static extern uint32 SetTransform(MatrixPtr _mtx, uint16 _num);
	    
	    /// <summary>
	    ///  Set model matrix from matrix cache for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_cache">Index in matrix cache.</param>
	    /// <param name="_num">Number of matrices from cache.</param>
	    ///
	    [LinkName("bgfx_set_transform_cached")]
	    public static extern void SetTransformCached(uint32 _cache, uint16 _num);
	    
	    /// <summary>
	    /// Reserve matrices in internal matrix cache.
	    /// @attention Pointer returned can be modifed until `bgfx::frame` is called.
	    /// </summary>
	    ///
	    /// <param name="_transform">Pointer to `Transform` structure.</param>
	    /// <param name="_num">Number of matrices.</param>
	    ///
	    [LinkName("bgfx_alloc_transform")]
	    public static extern uint32 AllocTransform(Transform* _transform, uint16 _num);
	    
	    /// <summary>
	    /// Set shader uniform parameter for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Uniform.</param>
	    /// <param name="_value">Pointer to uniform data.</param>
	    /// <param name="_num">Number of elements. Passing `UINT16_MAX` will use the _num passed on uniform creation.</param>
	    ///
	    [LinkName("bgfx_set_uniform")]
	    public static extern void SetUniform(UniformHandle _handle, void* _value, uint16 _num);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_set_index_buffer")]
	    public static extern void SetIndexBuffer(IndexBufferHandle _handle, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_set_dynamic_index_buffer")]
	    public static extern void SetDynamicIndexBuffer(DynamicIndexBufferHandle _handle, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set index buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_tib">Transient index buffer.</param>
	    /// <param name="_firstIndex">First index to render.</param>
	    /// <param name="_numIndices">Number of indices to render.</param>
	    ///
	    [LinkName("bgfx_set_transient_index_buffer")]
	    public static extern void SetTransientIndexBuffer(TransientIndexBuffer* _tib, uint32 _firstIndex, uint32 _numIndices);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_handle">Vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    ///
	    [LinkName("bgfx_set_vertex_buffer")]
	    public static extern void SetVertexBuffer(byte _stream, VertexBufferHandle _handle, uint32 _startVertex, uint32 _numVertices);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_handle">Dynamic vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    ///
	    [LinkName("bgfx_set_dynamic_vertex_buffer")]
	    public static extern void SetDynamicVertexBuffer(byte _stream, DynamicVertexBufferHandle _handle, uint32 _startVertex, uint32 _numVertices);
	    
	    /// <summary>
	    /// Set vertex buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stream">Vertex stream.</param>
	    /// <param name="_tvb">Transient vertex buffer.</param>
	    /// <param name="_startVertex">First vertex to render.</param>
	    /// <param name="_numVertices">Number of vertices to render.</param>
	    ///
	    [LinkName("bgfx_set_transient_vertex_buffer")]
	    public static extern void SetTransientVertexBuffer(byte _stream, TransientVertexBuffer* _tvb, uint32 _startVertex, uint32 _numVertices);
	    
	    /// <summary>
	    /// Set number of vertices for auto generated vertices use in conjuction
	    /// with gl_VertexID.
	    /// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
	    /// </summary>
	    ///
	    /// <param name="_numVertices">Number of vertices.</param>
	    ///
	    [LinkName("bgfx_set_vertex_count")]
	    public static extern void SetVertexCount(uint32 _numVertices);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_idb">Transient instance data buffer.</param>
	    /// <param name="_start">First instance data.</param>
	    /// <param name="_num">Number of data instances.</param>
	    ///
	    [LinkName("bgfx_set_instance_data_buffer")]
	    public static extern void SetInstanceDataBuffer(InstanceDataBuffer* _idb, uint32 _start, uint32 _num);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Vertex buffer.</param>
	    /// <param name="_startVertex">First instance data.</param>
	    /// <param name="_num">Number of data instances. Set instance data buffer for draw primitive.</param>
	    ///
	    [LinkName("bgfx_set_instance_data_from_vertex_buffer")]
	    public static extern void SetInstanceDataFromVertexBuffer(VertexBufferHandle _handle, uint32 _startVertex, uint32 _num);
	    
	    /// <summary>
	    /// Set instance data buffer for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_handle">Dynamic vertex buffer.</param>
	    /// <param name="_startVertex">First instance data.</param>
	    /// <param name="_num">Number of data instances.</param>
	    ///
	    [LinkName("bgfx_set_instance_data_from_dynamic_vertex_buffer")]
	    public static extern void SetInstanceDataFromDtnamicVertexBuffer(DynamicVertexBufferHandle _handle, uint32 _startVertex, uint32 _num);
	    
	    /// <summary>
	    /// Set number of instances for auto generated instances use in conjuction
	    /// with gl_InstanceID.
	    /// @attention Availability depends on: `BGFX_CAPS_VERTEX_ID`.
	    /// </summary>
	    ///
	    [LinkName("bgfx_set_instance_count")]
	    public static extern void SetInstanceCount(uint32 _numInstances);
	    
	    /// <summary>
	    /// Set texture stage for draw primitive.
	    /// </summary>
	    ///
	    /// <param name="_stage">Texture unit.</param>
	    /// <param name="_sampler">Program sampler.</param>
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_flags">Texture sampling mode. Default value UINT32_MAX uses   texture sampling settings from the texture.   - `BGFX_SAMPLER_[U/V/W]_[MIRROR/CLAMP]` - Mirror or clamp to edge wrap     mode.   - `BGFX_SAMPLER_[MIN/MAG/MIP]_[POINT/ANISOTROPIC]` - Point or anisotropic     sampling.</param>
	    ///
	    [LinkName("bgfx_set_texture")]
	    public static extern void SetTexture(byte _stage, UniformHandle _sampler, TextureHandle _handle, SamplerFlags _flags);
	    
	    /// <summary>
	    /// Submit an empty primitive for rendering. Uniforms and draw state
	    /// will be applied but no geometry will be submitted.
	    /// @remark
	    ///   These empty draw calls will sort before ordinary draw calls.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    ///
	    [LinkName("bgfx_touch")]
	    public static extern void Touch(ViewId _id);
	    
	    /// <summary>
	    /// Submit primitive for rendering.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Which states to discard for next draw. See BGFX_DISCARD_</param>
	    ///
	    [LinkName("bgfx_submit")]
	    public static extern void Submit(ViewId _id, ProgramHandle _program, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Submit primitive with occlusion query for rendering.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_occlusionQuery">Occlusion query.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Which states to discard for next draw. See BGFX_DISCARD_</param>
	    ///
	    [LinkName("bgfx_submit_occlusion_query")]
	    public static extern void SubmitOcclusionQuery(ViewId _id, ProgramHandle _program, OcclusionQueryHandle _occlusionQuery, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Submit primitive for rendering with index and instance data info from
	    /// indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Program.</param>
	    /// <param name="_indirectHandle">Indirect buffer.</param>
	    /// <param name="_start">First element in indirect buffer.</param>
	    /// <param name="_num">Number of dispatches.</param>
	    /// <param name="_depth">Depth for sorting.</param>
	    /// <param name="_flags">Which states to discard for next draw. See BGFX_DISCARD_</param>
	    ///
	    [LinkName("bgfx_submit_indirect")]
	    public static extern void SubmitIndirect(ViewId _id, ProgramHandle _program, IndirectBufferHandle _indirectHandle, uint16 _start, uint16 _num, uint32 _depth, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Set compute index buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Index buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_compute_index_buffer")]
	    public static extern void SetComputeIndexBuffer(byte _stage, IndexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Vertex buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_compute_vertex_buffer")]
	    public static extern void SetComputeVertexBuffer(byte _stage, VertexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute dynamic index buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Dynamic index buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_compute_dynamic_index_buffer")]
	    public static extern void SetComputeDynamicIndexBuffer(byte _stage, DynamicIndexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute dynamic vertex buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Dynamic vertex buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_compute_dynamic_vertex_buffer")]
	    public static extern void SetCompureDynamicVertexBuffer(byte _stage, DynamicVertexBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute indirect buffer.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Indirect buffer handle.</param>
	    /// <param name="_access">Buffer access. See `Access::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_compute_indirect_buffer")]
	    public static extern void SetComputeIndirectBuffer(byte _stage, IndirectBufferHandle _handle, Access _access);
	    
	    /// <summary>
	    /// Set compute image from texture.
	    /// </summary>
	    ///
	    /// <param name="_stage">Compute stage.</param>
	    /// <param name="_handle">Texture handle.</param>
	    /// <param name="_mip">Mip level.</param>
	    /// <param name="_access">Image access. See `Access::Enum`.</param>
	    /// <param name="_format">Texture format. See: `TextureFormat::Enum`.</param>
	    ///
	    [LinkName("bgfx_set_image")]
	    public static extern void SetImage(byte _stage, TextureHandle _handle, byte _mip, Access _access, TextureFormat _format);
	    
	    /// <summary>
	    /// Dispatch compute.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Compute program.</param>
	    /// <param name="_numX">Number of groups X.</param>
	    /// <param name="_numY">Number of groups Y.</param>
	    /// <param name="_numZ">Number of groups Z.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_dispatch")]
	    public static extern void Dispatch(ViewId _id, ProgramHandle _program, uint32 _numX, uint32 _numY, uint32 _numZ, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Dispatch compute indirect.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_program">Compute program.</param>
	    /// <param name="_indirectHandle">Indirect buffer.</param>
	    /// <param name="_start">First element in indirect buffer.</param>
	    /// <param name="_num">Number of dispatches.</param>
	    /// <param name="_flags">Discard or preserve states. See `BGFX_DISCARD_*`.</param>
	    ///
	    [LinkName("bgfx_dispatch_indirect")]
	    public static extern void DispatchIndirect(ViewId _id, ProgramHandle _program, IndirectBufferHandle _indirectHandle, uint16 _start, uint16 _num, DiscardFlags _flags);
	    
	    /// <summary>
	    /// Discard previously set state for draw or compute call.
	    /// </summary>
	    ///
	    /// <param name="_flags">Draw/compute states to discard.</param>
	    ///
	    [LinkName("bgfx_discard")]
	    public static extern void Discard(DiscardFlags _flags);
	    
	    /// <summary>
	    /// Blit 2D texture region between two 2D textures.
	    /// @attention Destination texture must be created with `BGFX_TEXTURE_BLIT_DST` flag.
	    /// @attention Availability depends on: `BGFX_CAPS_TEXTURE_BLIT`.
	    /// </summary>
	    ///
	    /// <param name="_id">View id.</param>
	    /// <param name="_dst">Destination texture handle.</param>
	    /// <param name="_dstMip">Destination texture mip level.</param>
	    /// <param name="_dstX">Destination texture X position.</param>
	    /// <param name="_dstY">Destination texture Y position.</param>
	    /// <param name="_dstZ">If texture is 2D this argument should be 0. If destination texture is cube this argument represents destination texture cube face. For 3D texture this argument represents destination texture Z position.</param>
	    /// <param name="_src">Source texture handle.</param>
	    /// <param name="_srcMip">Source texture mip level.</param>
	    /// <param name="_srcX">Source texture X position.</param>
	    /// <param name="_srcY">Source texture Y position.</param>
	    /// <param name="_srcZ">If texture is 2D this argument should be 0. If source texture is cube this argument represents source texture cube face. For 3D texture this argument represents source texture Z position.</param>
	    /// <param name="_width">Width of region.</param>
	    /// <param name="_height">Height of region.</param>
	    /// <param name="_depth">If texture is 3D this argument represents depth of region, otherwise it's unused.</param>
	    ///
	    [LinkName("bgfx_blit")]
	    public static extern void Blit(ViewId _id, TextureHandle _dst, byte _dstMip, uint16 _dstX, uint16 _dstY, uint16 _dstZ, TextureHandle _src, byte _srcMip, uint16 _srcX, uint16 _srcY, uint16 _srcZ, uint16 _width, uint16 _height, uint16 _depth);
	}
}